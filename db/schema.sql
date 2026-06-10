-- =============================================
-- DARK SOULS PATHFINDER — Database Schema
-- Run this in Aiven console → Query Editor
-- Uses defaultdb (no CREATE DATABASE needed)
-- =============================================

CREATE TABLE IF NOT EXISTS users (
  id            INT AUTO_INCREMENT PRIMARY KEY,
  username      VARCHAR(50)  NOT NULL UNIQUE,
  email         VARCHAR(120) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  role          ENUM('user','admin') NOT NULL DEFAULT 'user',
  created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS games (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  slug        VARCHAR(10)  NOT NULL UNIQUE,
  title       VARCHAR(100) NOT NULL,
  subtitle    VARCHAR(200),
  description TEXT,
  image_url   VARCHAR(255),
  is_active   BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS zones (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  game_id     INT          NOT NULL,
  name        VARCHAR(100) NOT NULL,
  description TEXT,
  image_url   VARCHAR(255),
  lore        TEXT,
  sort_order  INT          NOT NULL DEFAULT 0,
  FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS zone_prerequisites (
  zone_id          INT NOT NULL,
  required_zone_id INT NOT NULL,
  PRIMARY KEY (zone_id, required_zone_id),
  FOREIGN KEY (zone_id)          REFERENCES zones(id) ON DELETE CASCADE,
  FOREIGN KEY (required_zone_id) REFERENCES zones(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS bosses (
  id           INT AUTO_INCREMENT PRIMARY KEY,
  zone_id      INT          NOT NULL,
  name         VARCHAR(100) NOT NULL,
  description  TEXT,
  image_url    VARCHAR(255),
  lore         TEXT,
  hp           INT,
  souls_reward INT,
  weakness     VARCHAR(200),
  resistance   VARCHAR(200),
  location     VARCHAR(200),
  sort_order   INT NOT NULL DEFAULT 0,
  FOREIGN KEY (zone_id) REFERENCES zones(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS zone_ratings (
  id           INT AUTO_INCREMENT PRIMARY KEY,
  user_id      INT     NOT NULL,
  zone_id      INT     NOT NULL,
  score_look   TINYINT NOT NULL CHECK (score_look  BETWEEN 1 AND 10),
  score_atm    TINYINT NOT NULL CHECK (score_atm   BETWEEN 1 AND 10),
  score_fair   TINYINT NOT NULL CHECK (score_fair  BETWEEN 1 AND 10),
  score_avg    DECIMAL(4,2) GENERATED ALWAYS AS
                 ((score_look + score_atm + score_fair) / 3.0) STORED,
  comment      TEXT,
  created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uq_user_zone (user_id, zone_id),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (zone_id) REFERENCES zones(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS boss_ratings (
  id            INT AUTO_INCREMENT PRIMARY KEY,
  user_id       INT     NOT NULL,
  boss_id       INT     NOT NULL,
  score_design  TINYINT NOT NULL CHECK (score_design BETWEEN 1 AND 10),
  score_arena   TINYINT NOT NULL CHECK (score_arena  BETWEEN 1 AND 10),
  score_fair    TINYINT NOT NULL CHECK (score_fair   BETWEEN 1 AND 10),
  score_avg     DECIMAL(4,2) GENERATED ALWAYS AS
                  ((score_design + score_arena + score_fair) / 3.0) STORED,
  comment       TEXT,
  created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uq_user_boss (user_id, boss_id),
  FOREIGN KEY (user_id) REFERENCES users(id)  ON DELETE CASCADE,
  FOREIGN KEY (boss_id) REFERENCES bosses(id) ON DELETE CASCADE
);
