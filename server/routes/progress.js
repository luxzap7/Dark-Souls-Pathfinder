// progress.js
const express         = require('express');
const { pool }        = require('../db/connection');
const { requireAuth } = require('../middleware/auth');
const router          = express.Router();

router.get('/:gameId', requireAuth, async (req, res) => {
  const userId = req.session.user.id;
  const gameId = parseInt(req.params.gameId);
  try {
    const [[totals]] = await pool.execute(`
      SELECT COUNT(DISTINCT z.id) AS total_zones, COUNT(DISTINCT b.id) AS total_bosses
      FROM zones z LEFT JOIN bosses b ON b.zone_id = z.id WHERE z.game_id = ?
    `, [gameId]);
    const [[rated]] = await pool.execute(`
      SELECT COUNT(DISTINCT zr.zone_id) AS rated_zones, COUNT(DISTINCT br.boss_id) AS rated_bosses
      FROM zones z
      LEFT JOIN zone_ratings zr ON zr.zone_id = z.id AND zr.user_id = ?
      LEFT JOIN bosses b ON b.zone_id = z.id
      LEFT JOIN boss_ratings br ON br.boss_id = b.id AND br.user_id = ?
      WHERE z.game_id = ?
    `, [userId, userId, gameId]);
    const totalItems = totals.total_zones + totals.total_bosses;
    const ratedItems = rated.rated_zones + rated.rated_bosses;
    res.json({
      total_zones: totals.total_zones, total_bosses: totals.total_bosses,
      rated_zones: rated.rated_zones,  rated_bosses: rated.rated_bosses,
      total_items: totalItems, rated_items: ratedItems,
      percentage: totalItems > 0 ? Math.round((ratedItems / totalItems) * 100) : 0,
    });
  } catch (err) { console.error(err); res.status(500).json({ error: 'Failed to fetch progress.' }); }
});

module.exports = router;
