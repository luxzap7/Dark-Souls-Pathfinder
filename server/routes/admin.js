const express          = require('express');
const { pool }         = require('../db/connection');
const { requireAdmin } = require('../middleware/auth');
const router           = express.Router();

router.use(requireAdmin);

// ── PUT /api/admin/zones/:id/lore
router.put('/zones/:id/lore', async (req, res) => {
  const { lore } = req.body;
  if (!lore || lore.trim().length < 10)
    return res.status(400).json({ error: 'Lore text must be at least 10 characters.' });
  try {
    await pool.execute('UPDATE zones SET lore = ? WHERE id = ?', [lore.trim(), req.params.id]);
    res.json({ message: 'Zone lore updated.' });
  } catch (err) { res.status(500).json({ error: 'Failed to update lore.' }); }
});

// ── PUT /api/admin/bosses/:id/lore
router.put('/bosses/:id/lore', async (req, res) => {
  const { lore } = req.body;
  if (!lore || lore.trim().length < 10)
    return res.status(400).json({ error: 'Lore text must be at least 10 characters.' });
  try {
    await pool.execute('UPDATE bosses SET lore = ? WHERE id = ?', [lore.trim(), req.params.id]);
    res.json({ message: 'Boss lore updated.' });
  } catch (err) { res.status(500).json({ error: 'Failed to update lore.' }); }
});

// ── GET /api/admin/users
router.get('/users', async (_req, res) => {
  try {
    const [rows] = await pool.execute(
      'SELECT id, username, email, role, created_at FROM users ORDER BY created_at DESC'
    );
    res.json(rows);
  } catch (err) { res.status(500).json({ error: 'Failed to fetch users.' }); }
});

// ── GET /api/admin/stats  — dashboard numbers
router.get('/stats', async (_req, res) => {
  try {
    const [[users]]     = await pool.execute('SELECT COUNT(*) AS count FROM users');
    const [[zones]]     = await pool.execute('SELECT COUNT(*) AS count FROM zones');
    const [[bosses]]    = await pool.execute('SELECT COUNT(*) AS count FROM bosses');
    const [[zRatings]]  = await pool.execute('SELECT COUNT(*) AS count FROM zone_ratings');
    const [[bRatings]]  = await pool.execute('SELECT COUNT(*) AS count FROM boss_ratings');
    const [[noLoreZ]]   = await pool.execute('SELECT COUNT(*) AS count FROM zones WHERE lore IS NULL OR lore = ""');
    const [[noLoreB]]   = await pool.execute('SELECT COUNT(*) AS count FROM bosses WHERE lore IS NULL OR lore = ""');
    res.json({
      users:      users.count,
      zones:      zones.count,
      bosses:     bosses.count,
      zoneRatings:  zRatings.count,
      bossRatings:  bRatings.count,
      missingZoneLore: noLoreZ.count,
      missingBossLore: noLoreB.count,
    });
  } catch (err) { res.status(500).json({ error: 'Failed to fetch stats.' }); }
});

// ── GET /api/admin/zones  — all zones with lore status
router.get('/zones', async (_req, res) => {
  try {
    const [rows] = await pool.execute(`
      SELECT z.id, z.name, z.sort_order, g.title AS game_title,
        CASE WHEN z.lore IS NULL OR z.lore = '' THEN 0 ELSE 1 END AS has_lore,
        CHAR_LENGTH(z.lore) AS lore_length, z.lore
      FROM zones z JOIN games g ON g.id = z.game_id
      ORDER BY g.id, z.sort_order
    `);
    res.json(rows);
  } catch (err) { res.status(500).json({ error: 'Failed to fetch zones.' }); }
});

// ── GET /api/admin/bosses  — all bosses with lore status
router.get('/bosses', async (_req, res) => {
  try {
    const [rows] = await pool.execute(`
      SELECT b.id, b.name, b.sort_order, z.name AS zone_name, g.title AS game_title,
        CASE WHEN b.lore IS NULL OR b.lore = '' THEN 0 ELSE 1 END AS has_lore,
        CHAR_LENGTH(b.lore) AS lore_length, b.lore
      FROM bosses b JOIN zones z ON z.id = b.zone_id JOIN games g ON g.id = z.game_id
      ORDER BY g.id, z.sort_order, b.sort_order
    `);
    res.json(rows);
  } catch (err) { res.status(500).json({ error: 'Failed to fetch bosses.' }); }
});

// ── DELETE /api/admin/ratings/zone/:id  — remove a zone rating
router.delete('/ratings/zone/:id', async (req, res) => {
  try {
    await pool.execute('DELETE FROM zone_ratings WHERE id = ?', [req.params.id]);
    res.json({ message: 'Zone rating removed.' });
  } catch (err) { res.status(500).json({ error: 'Failed to remove rating.' }); }
});

// ── DELETE /api/admin/ratings/boss/:id  — remove a boss rating
router.delete('/ratings/boss/:id', async (req, res) => {
  try {
    await pool.execute('DELETE FROM boss_ratings WHERE id = ?', [req.params.id]);
    res.json({ message: 'Boss rating removed.' });
  } catch (err) { res.status(500).json({ error: 'Failed to remove rating.' }); }
});

module.exports = router;

// GET /api/admin/stats — platform-wide counts
router.get('/stats', async (_req, res) => {
  try {
    const [[counts]] = await pool.execute(`
      SELECT
        (SELECT COUNT(*) FROM users)        AS total_users,
        (SELECT COUNT(*) FROM zone_ratings) AS zone_ratings,
        (SELECT COUNT(*) FROM boss_ratings) AS boss_ratings,
        (SELECT COUNT(*) FROM zones)        AS total_zones,
        (SELECT COUNT(*) FROM bosses)       AS total_bosses
    `);
    res.json(counts);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to fetch stats.' });
  }
});
