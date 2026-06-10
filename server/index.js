require('dotenv').config();
const express  = require('express');
const session  = require('express-session');
const cors     = require('cors');
const path     = require('path');
const { testConnection } = require('./db/connection');

const app  = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, '../public')));
app.use(session({
  secret: process.env.SESSION_SECRET || 'dev_secret',
  resave: false,
  saveUninitialized: false,
  cookie: { secure: process.env.NODE_ENV === 'production', httpOnly: true, maxAge: 1000*60*60*24*7 },
}));

app.use('/api/auth',     require('./routes/auth'));
app.use('/api/games',    require('./routes/games'));
app.use('/api/zones',    require('./routes/zones'));
app.use('/api/bosses',   require('./routes/bosses'));
app.use('/api/progress', require('./routes/progress'));
app.use('/api/admin',    require('./routes/admin'));

app.get('/api/health', (_req, res) => res.json({ status: 'ok', timestamp: new Date().toISOString() }));
app.get('*', (_req, res) => res.sendFile(path.join(__dirname, '../public/index.html')));

testConnection().then(() => {
  app.listen(PORT, () => console.log(`🔥 Dark Souls Pathfinder → http://localhost:${PORT}`));
});
