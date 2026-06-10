const express         = require('express');
const { pool }        = require('../db/connection');
const { requireAuth } = require('../middleware/auth');
const router          = express.Router();

router.get('/:id', async (req, res) => {
  const userId = req.session?.user?.id ?? null;
  const bossId = parseInt(req.params.id);
  try {
    const [[boss]] = await pool.execute(`
      SELECT b.*, ROUND(AVG(br.score_avg),2) AS community_avg, COUNT(br.id) AS total_ratings,
        ROUND(AVG(br.score_design),2) AS avg_design, ROUND(AVG(br.score_arena),2) AS avg_arena,
        ROUND(AVG(br.score_fair),2) AS avg_fair
      FROM bosses b LEFT JOIN boss_ratings br ON br.boss_id = b.id
      WHERE b.id = ? GROUP BY b.id
    `, [bossId]);
    if (!boss) return res.status(404).json({ error: 'Boss not found.' });

    if (userId) {
      const [[zr]] = await pool.execute(
        'SELECT id FROM zone_ratings WHERE user_id = ? AND zone_id = ?', [userId, boss.zone_id]
      );
      boss.unlocked = !!zr;
      const [[ur]] = await pool.execute(
        'SELECT score_design, score_arena, score_fair, score_avg, comment FROM boss_ratings WHERE user_id = ? AND boss_id = ?',
        [userId, bossId]
      );
      boss.user_rating = ur || null;
    } else { boss.unlocked = false; boss.user_rating = null; }
    res.json({ boss });
  } catch (err) { console.error(err); res.status(500).json({ error: 'Failed to fetch boss.' }); }
});

router.post('/:id/rating', requireAuth, async (req, res) => {
  const userId = req.session.user.id;
  const bossId = parseInt(req.params.id);
  const { score_design, score_arena, score_fair, comment } = req.body;
  const scores = [score_design, score_arena, score_fair].map(Number);
  if (scores.some(s => isNaN(s) || s < 1 || s > 10))
    return res.status(400).json({ error: 'Each score must be between 1 and 10.' });

  const [[boss]] = await pool.execute('SELECT zone_id FROM bosses WHERE id = ?', [bossId]);
  if (!boss) return res.status(404).json({ error: 'Boss not found.' });
  const [[zr]] = await pool.execute(
    'SELECT id FROM zone_ratings WHERE user_id = ? AND zone_id = ?', [userId, boss.zone_id]
  );
  if (!zr) return res.status(403).json({ error: 'Rate the zone before rating its bosses.' });

  try {
    await pool.execute(`
      INSERT INTO boss_ratings (user_id, boss_id, score_design, score_arena, score_fair, comment)
      VALUES (?, ?, ?, ?, ?, ?)
      ON DUPLICATE KEY UPDATE score_design=VALUES(score_design), score_arena=VALUES(score_arena),
        score_fair=VALUES(score_fair), comment=VALUES(comment), updated_at=CURRENT_TIMESTAMP
    `, [userId, bossId, scores[0], scores[1], scores[2], comment || null]);
    res.json({ message: 'Boss rating saved.' });
  } catch (err) { console.error(err); res.status(500).json({ error: 'Failed to save boss rating.' }); }
});

module.exports = router;
