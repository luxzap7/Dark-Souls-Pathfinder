const express  = require('express');
const { pool } = require('../db/connection');
const router   = express.Router();

router.get('/', async (_req, res) => {
  try {
    const [rows] = await pool.execute('SELECT * FROM games ORDER BY id');
    res.json(rows);
  } catch (err) { res.status(500).json({ error: 'Failed to fetch games.' }); }
});

router.get('/:id', async (req, res) => {
  const userId = req.session?.user?.id ?? null;
  const gameId = parseInt(req.params.id);
  try {
    const [[game]] = await pool.execute('SELECT * FROM games WHERE id = ?', [gameId]);
    if (!game) return res.status(404).json({ error: 'Game not found.' });

    const [zones] = await pool.execute(`
      SELECT z.id, z.name, z.description, z.image_url, z.sort_order,
        ROUND(AVG(zr.score_avg), 2) AS community_avg,
        COUNT(zr.id) AS total_ratings
      FROM zones z
      LEFT JOIN zone_ratings zr ON zr.zone_id = z.id
      WHERE z.game_id = ?
      GROUP BY z.id ORDER BY z.sort_order
    `, [gameId]);

    if (userId) {
      for (const zone of zones) {
        const [prereqs] = await pool.execute(
          'SELECT required_zone_id FROM zone_prerequisites WHERE zone_id = ?', [zone.id]
        );
        if (prereqs.length === 0) {
          zone.unlocked = true;
        } else {
          const requiredIds = prereqs.map(r => r.required_zone_id);
          const placeholders = requiredIds.map(() => '?').join(',');
          const [rated] = await pool.execute(
            `SELECT zone_id FROM zone_ratings WHERE user_id = ? AND zone_id IN (${placeholders})`,
            [userId, ...requiredIds]
          );
          zone.unlocked = rated.length === requiredIds.length;
        }
        const [[userRating]] = await pool.execute(
          'SELECT score_avg, comment FROM zone_ratings WHERE user_id = ? AND zone_id = ?',
          [userId, zone.id]
        );
        zone.user_rating = userRating || null;
      }
    } else {
      zones.forEach(z => { z.unlocked = false; z.user_rating = null; });
    }
    res.json({ game, zones });
  } catch (err) { console.error(err); res.status(500).json({ error: 'Failed to fetch game data.' }); }
});

module.exports = router;
