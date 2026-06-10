const express         = require('express');
const { pool }        = require('../db/connection');
const { requireAuth } = require('../middleware/auth');
const router          = express.Router();

router.get('/:id', async (req, res) => {
  const userId = req.session?.user?.id ?? null;
  const zoneId = parseInt(req.params.id);
  try {
    const [[zone]] = await pool.execute(`
      SELECT z.*, ROUND(AVG(zr.score_avg),2) AS community_avg, COUNT(zr.id) AS total_ratings,
        ROUND(AVG(zr.score_look),2) AS avg_look, ROUND(AVG(zr.score_atm),2) AS avg_atm,
        ROUND(AVG(zr.score_fair),2) AS avg_fair
      FROM zones z LEFT JOIN zone_ratings zr ON zr.zone_id = z.id
      WHERE z.id = ? GROUP BY z.id
    `, [zoneId]);
    if (!zone) return res.status(404).json({ error: 'Zone not found.' });

    const [bosses] = await pool.execute(`
      SELECT b.id, b.name, b.description, b.image_url, b.sort_order,
        ROUND(AVG(br.score_avg),2) AS community_avg, COUNT(br.id) AS total_ratings
      FROM bosses b LEFT JOIN boss_ratings br ON br.boss_id = b.id
      WHERE b.zone_id = ? GROUP BY b.id ORDER BY b.sort_order
    `, [zoneId]);

    if (userId) {
      const [[userZoneRating]] = await pool.execute(
        'SELECT id FROM zone_ratings WHERE user_id = ? AND zone_id = ?', [userId, zoneId]
      );
      const zoneRated = !!userZoneRating;
      for (const boss of bosses) {
        boss.unlocked = zoneRated;
        const [[ubr]] = await pool.execute(
          'SELECT score_avg, comment FROM boss_ratings WHERE user_id = ? AND boss_id = ?', [userId, boss.id]
        );
        boss.user_rating = ubr || null;
      }
      const [[ur]] = await pool.execute(
        'SELECT score_look, score_atm, score_fair, score_avg, comment FROM zone_ratings WHERE user_id = ? AND zone_id = ?',
        [userId, zoneId]
      );
      zone.user_rating = ur || null;
    } else {
      bosses.forEach(b => { b.unlocked = false; b.user_rating = null; });
      zone.user_rating = null;
    }
    res.json({ zone, bosses });
  } catch (err) { console.error(err); res.status(500).json({ error: 'Failed to fetch zone.' }); }
});

router.post('/:id/rating', requireAuth, async (req, res) => {
  const userId = req.session.user.id;
  const zoneId = parseInt(req.params.id);
  const { score_look, score_atm, score_fair, comment } = req.body;
  const scores = [score_look, score_atm, score_fair].map(Number);
  if (scores.some(s => isNaN(s) || s < 1 || s > 10))
    return res.status(400).json({ error: 'Each score must be between 1 and 10.' });

  const [prereqs] = await pool.execute(
    'SELECT required_zone_id FROM zone_prerequisites WHERE zone_id = ?', [zoneId]
  );
  if (prereqs.length > 0) {
    const requiredIds = prereqs.map(r => r.required_zone_id);
    const placeholders = requiredIds.map(() => '?').join(',');
    const [rated] = await pool.execute(
      `SELECT zone_id FROM zone_ratings WHERE user_id = ? AND zone_id IN (${placeholders})`,
      [userId, ...requiredIds]
    );
    if (rated.length < requiredIds.length)
      return res.status(403).json({ error: 'You have not yet reached this zone.' });
  }
  try {
    await pool.execute(`
      INSERT INTO zone_ratings (user_id, zone_id, score_look, score_atm, score_fair, comment)
      VALUES (?, ?, ?, ?, ?, ?)
      ON DUPLICATE KEY UPDATE score_look=VALUES(score_look), score_atm=VALUES(score_atm),
        score_fair=VALUES(score_fair), comment=VALUES(comment), updated_at=CURRENT_TIMESTAMP
    `, [userId, zoneId, scores[0], scores[1], scores[2], comment || null]);
    res.json({ message: 'Rating saved.' });
  } catch (err) { console.error(err); res.status(500).json({ error: 'Failed to save rating.' }); }
});

module.exports = router;
