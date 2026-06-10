const express  = require('express');
const bcrypt   = require('bcryptjs');
const { pool } = require('../db/connection');
const router   = express.Router();

router.post('/register', async (req, res) => {
  const { username, email, password, role, adminKey } = req.body;
  if (!username || !email || !password) return res.status(400).json({ error: 'All fields are required.' });
  if (username.length < 3 || username.length > 50) return res.status(400).json({ error: 'Username must be 3–50 characters.' });
  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) return res.status(400).json({ error: 'Invalid email address.' });
  if (password.length < 8) return res.status(400).json({ error: 'Password must be at least 8 characters.' });
  const assignedRole = (role === 'admin' && adminKey === process.env.ADMIN_KEY) ? 'admin' : 'user';
  try {
    const hash = await bcrypt.hash(password, 12);
    const [result] = await pool.execute(
      'INSERT INTO users (username, email, password_hash, role) VALUES (?, ?, ?, ?)',
      [username, email, hash, assignedRole]
    );
    req.session.user = { id: result.insertId, username, email, role: assignedRole };
    res.status(201).json({ message: 'Account created.', user: req.session.user });
  } catch (err) {
    if (err.code === 'ER_DUP_ENTRY') return res.status(409).json({ error: 'Username or email already in use.' });
    console.error(err);
    res.status(500).json({ error: 'Server error during registration.' });
  }
});

router.post('/login', async (req, res) => {
  const { email, password } = req.body;
  if (!email || !password) return res.status(400).json({ error: 'Email and password are required.' });
  try {
    const [rows] = await pool.execute(
      'SELECT id, username, email, password_hash, role FROM users WHERE email = ?', [email]
    );
    if (!rows.length) return res.status(401).json({ error: 'Invalid email or password.' });
    const user = rows[0];
    const match = await bcrypt.compare(password, user.password_hash);
    if (!match) return res.status(401).json({ error: 'Invalid email or password.' });
    req.session.user = { id: user.id, username: user.username, email: user.email, role: user.role };
    res.json({ message: 'Logged in.', user: req.session.user });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Server error during login.' });
  }
});

router.post('/logout', (req, res) => {
  req.session.destroy(() => res.json({ message: 'Logged out.' }));
});

router.get('/me', (req, res) => {
  if (!req.session?.user) return res.status(401).json({ user: null });
  res.json({ user: req.session.user });
});

module.exports = router;
