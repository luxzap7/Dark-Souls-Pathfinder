-- =============================================
-- DARK SOULS PATHFINDER — DS2 Image Updates
-- Zone images: darksouls2.wiki.fextralife.com/file/Dark-Souls-2/[Name]-area.png
-- Boss images: darksouls2.wiki.fextralife.com/file/Dark-Souls-2/[name].png/.jpg
--   (filenames confirmed from darksouls2.wiki.fextralife.com/Bosses index)
-- Run in DBeaver against defaultdb
-- =============================================

-- ── DS2 ZONE IMAGES ──────────────────────────
UPDATE zones SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/Things%20Betwixt-area.png'            WHERE id = 18;
UPDATE zones SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/images/Dark-Souls-2/Majula-area.png' WHERE id = 19;
UPDATE zones SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/Forest%20of%20Fallen%20Giants-area.png' WHERE id = 20;
UPDATE zones SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/Heide%27s%20Tower%20of%20Flame-area.png' WHERE id = 21;
UPDATE zones SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/No-Man%27s%20Wharf-area.png'           WHERE id = 22;
UPDATE zones SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/The%20Lost%20Bastille-area.png'        WHERE id = 23;
UPDATE zones SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/Sinner%27s%20Rise-area.png'           WHERE id = 24;
UPDATE zones SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/Huntsman%27s%20Copse-area.png'        WHERE id = 25;
UPDATE zones SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/Harvest%20Valley-area.png'            WHERE id = 26;
UPDATE zones SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/Earthen%20Peak-area.png'              WHERE id = 27;
UPDATE zones SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/images/Iron%20Keep-area.png' WHERE id = 28;
UPDATE zones SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/Shaded%20Woods-area.png'              WHERE id = 29;
UPDATE zones SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/Drangleic%20Castle-area.png'          WHERE id = 30;
UPDATE zones SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/Shrine%20of%20Amana-area.png'         WHERE id = 31;
UPDATE zones SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/Undead%20Crypt-area.png'              WHERE id = 32;
UPDATE zones SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/Black%20Gulch-area.png'               WHERE id = 33;
UPDATE zones SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/Brightstone%20Cove%20Tseldora-area.png' WHERE id = 34;
UPDATE zones SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/Throne%20of%20Want-area.png'          WHERE id = 35;

-- ── DS2 BOSS IMAGES ──────────────────────────
-- All filenames confirmed from darksouls2.wiki.fextralife.com/Bosses index page
UPDATE bosses SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/the_last_giant.png'                  WHERE id = 18;
UPDATE bosses SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/pursuer.jpg'                         WHERE id = 19;
UPDATE bosses SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/dragonrider.png'                     WHERE id = 20;
UPDATE bosses SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/Old_Dragonslayer.png'                WHERE id = 21;
UPDATE bosses SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/flexile_sentry.jpg'                  WHERE id = 22;
UPDATE bosses SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/ruin_sentinels.png'                  WHERE id = 23;
UPDATE bosses SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/belfry_gargoyles.png'                WHERE id = 24;
UPDATE bosses SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/lost_sinner.png'                     WHERE id = 25;
UPDATE bosses SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/the_skeleton_lords.png'              WHERE id = 26;
UPDATE bosses SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/covetous_demon.png'                  WHERE id = 27;
UPDATE bosses SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/mytha_the_baneful_queen.png'         WHERE id = 28;
UPDATE bosses SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/smelter_demon.png'                   WHERE id = 29;
UPDATE bosses SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/old_iron_king.png'                   WHERE id = 30;
UPDATE bosses SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/scorpioness_najka.png'               WHERE id = 31;
UPDATE bosses SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/prowling_magus_and_congregation.png' WHERE id = 32;
UPDATE bosses SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/dukes_dear_freja.png'                WHERE id = 33;
UPDATE bosses SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/the_rotten.png'                      WHERE id = 34;
UPDATE bosses SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/Demon_of_Song.png'                   WHERE id = 35;
UPDATE bosses SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/velstadt_the_royal_aegis.png'        WHERE id = 36;
UPDATE bosses SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/vendrick.png'                        WHERE id = 37;
UPDATE bosses SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/throne_watcher_and_throne_defender.png' WHERE id = 38;
UPDATE bosses SET image_url = 'https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/nashandra.png'                       WHERE id = 39;

-- ── DS2 GAME CARD ─────────────────────────────
-- Majula at sunset — the most iconic vista in DS2
UPDATE games SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/images/Dark-Souls-2/Majula-area.png' WHERE id = 2;
