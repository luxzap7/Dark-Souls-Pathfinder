-- =============================================
-- DARK SOULS PATHFINDER — DS3 Image Updates
-- Zone images: static1.fextralifeimages.com/wordpress/wp-content/uploads/file/Dark-Souls-3/
--   (all filenames confirmed from darksouls3.wiki.fextralife.com/Locations)
-- Boss images: static1.fextralifeimages.com/wordpress/wp-content/uploads/images/
--   (filenames confirmed by fetching individual boss pages)
-- Run in DBeaver against defaultdb
-- =============================================

-- ── DS3 ZONE IMAGES ──────────────────────────
UPDATE zones SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/file/Dark-Souls-3/1.2_cemetery_of_ash-new.jpg'              WHERE id = 36;
UPDATE zones SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/file/Dark-Souls-3/1.1_firelink_shrine-new.jpg'              WHERE id = 37;
UPDATE zones SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/file/Dark-Souls-3/2.1_high_wall_of_lothric-new.jpg'         WHERE id = 38;
UPDATE zones SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/file/Dark-Souls-3/3.2_undead_settlement-new.jpg'            WHERE id = 39;
UPDATE zones SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/file/Dark-Souls-3/4.1_road_of_sacrifices-new.jpg'           WHERE id = 40;
UPDATE zones SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/file/Dark-Souls-3/5.1_cathedral_of_the_deep-new.jpg'        WHERE id = 41;
UPDATE zones SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/file/Dark-Souls-3/4.5_farron_keep-new.jpg'                  WHERE id = 42;
UPDATE zones SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/file/Dark-Souls-3/6.1_catacombs_of_carthus-new.jpg'         WHERE id = 43;
UPDATE zones SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/file/Dark-Souls-3/6.6_old_demon_king-new.jpg'               WHERE id = 44;
UPDATE zones SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/file/Dark-Souls-3/7.1_irithyll_of_the_boreal_valley-new.jpg' WHERE id = 45;
UPDATE zones SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/file/Dark-Souls-3/8.1_irithyll_dungeon-new.jpg'             WHERE id = 46;
UPDATE zones SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/file/Dark-Souls-3/8.2_profaned_capital-new.jpg'             WHERE id = 47;
UPDATE zones SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/file/Dark-Souls-3/7.7_anor_londo-new.jpg'                   WHERE id = 48;
UPDATE zones SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/file/Dark-Souls-3/9.1_lothric_castle-new.jpg'               WHERE id = 49;
UPDATE zones SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/file/Dark-Souls-3/9.4_grand_archives-new.jpg'               WHERE id = 50;
UPDATE zones SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/file/Dark-Souls-3/1.4_untended_graves-new.jpg'              WHERE id = 51;
UPDATE zones SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/file/Dark-Souls-3/10.1_archdragon_peak-new.jpg'             WHERE id = 52;
UPDATE zones SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/file/Dark-Souls-3/11.2_kiln_of_the_first_flame-new.jpg'    WHERE id = 53;

-- ── DS3 BOSS IMAGES ──────────────────────────
-- All URLs confirmed by fetching individual boss pages on darksouls3.wiki.fextralife.com
UPDATE bosses SET image_url = 'https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/iudex-gundyr-enemies-dark-souls-3-wiki-guide1.jpg'                  WHERE id = 40;
UPDATE bosses SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/images/vordt-enemies-dark-souls-3-wiki-guide.jpg'          WHERE id = 41;
UPDATE bosses SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/file/Dark-Souls-3/curse-rotted_greatwood_trophy.PNG'       WHERE id = 42;
UPDATE bosses SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/images/crystal-sage-enemy-dark-souls-3-wiki-guide.jpg'     WHERE id = 43;
UPDATE bosses SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/images/deacon-of-the-deep-enemy-dark-souls-3-wiki-guide.jpg' WHERE id = 44;
UPDATE bosses SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/images/abyss-watcher-enemies-dark-souls-3-wiki-guide.jpg'  WHERE id = 45;
UPDATE bosses SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/images/high-lord-wolnir-enemy-dark-souls-3-wiki-guide.jpg' WHERE id = 46;
UPDATE bosses SET image_url = 'https://fextralife.com/file/Dark-Souls-3/old_demon_king-dks3_small.jpg'                                                       WHERE id = 47;
UPDATE bosses SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/images/pontiff_sulyvahn_trophy_revision1.png'              WHERE id = 48;
UPDATE bosses SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/images/aldrich-devourer-of-gods-enemy-dark-souls-3-wiki-guide.jpg' WHERE id = 49;
UPDATE bosses SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/images/yhorm-the-giant-enemies-dark-souls-3-wiki-guide.jpg' WHERE id = 50;
UPDATE bosses SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/images/dancer-of-the-boreal-valley-enemies-dark-souls-3-wiki-guide.jpg' WHERE id = 51;
UPDATE bosses SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/images/dragonslayer-armor-enemies-dark-souls-3-wiki-guide.jpg' WHERE id = 52;
UPDATE bosses SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/images/Dark-Souls-3/Ocelot.png'                             WHERE id = 53;
UPDATE bosses SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/images/champion-gundyr-enemies-dark-souls-3-wiki-guide.jpg' WHERE id = 54;
UPDATE bosses SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/images/ancient-wyvern-enemies-dark-souls-3-wiki-guide.jpg' WHERE id = 55;
UPDATE bosses SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/images/the-nameless-king-enemies-dark-souls-3-wiki-guide.jpg' WHERE id = 56;
UPDATE bosses SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/images/lothric-younger-prince-enemies-dark-souls-3-wiki-guide.jpg' WHERE id = 57;
UPDATE bosses SET image_url = 'https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/Soul of Cinder.jpg'                                                  WHERE id = 58;

-- ── DS3 GAME CARD ─────────────────────────────
-- Irithyll of the Boreal Valley — the most visually striking area in DS3
UPDATE games SET image_url = 'https://static1.fextralifeimages.com/wordpress/wp-content/uploads/file/Dark-Souls-3/7.1_irithyll_of_the_boreal_valley-new.jpg' WHERE id = 3;
