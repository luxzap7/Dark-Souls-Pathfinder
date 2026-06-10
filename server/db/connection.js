const mysql = require('mysql2/promise');
require('dotenv').config();

// Aiven requires SSL — accepts both 'true' and 'REQUIRED'
const useSSL = ['true', 'required', '1'].includes(
  (process.env.DB_SSL || '').toLowerCase()
);

const pool = mysql.createPool({
  host:     process.env.DB_HOST,
  port:     parseInt(process.env.DB_PORT) || 3306,
  database: process.env.DB_NAME,
  user:     process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  ssl:      useSSL ? { rejectUnauthorized: false } : false,
  waitForConnections: true,
  connectionLimit:    10,
  queueLimit:         0,
});

async function testConnection() {
  try {
    const conn = await pool.getConnection();
    console.log('✅ Connected to Aiven MySQL');
    conn.release();
  } catch (err) {
    console.error('❌ Database connection failed:', err.message);
    process.exit(1);
  }
}

module.exports = { pool, testConnection };
