-- =============================================
-- DARK SOULS PATHFINDER — DS1 Image Updates
-- All URLs verified from darksouls.wiki.fextralife.com
-- Zone images: [name]_walkthrough_dark_souls_remastered_wiki_guide.jpg
-- Boss images: Boss_XXXX_[Name].jpg (internal numbering confirmed)
-- Run in DBeaver against defaultdb
-- =============================================

-- ── DS1 ZONE IMAGES ──────────────────────────
UPDATE zones SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/undead_asylum_walkthrough_dark_souls_remastered_wiki_guide.jpg' WHERE id = 1;
UPDATE zones SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/Firelinktitle.jpg'                                               WHERE id = 2;
UPDATE zones SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/undead_burg_walkthrough_dark_souls_remastered_wiki_guide.jpg'    WHERE id = 3;
UPDATE zones SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/undead_parish_walkthrough_dark_souls_remastered_wiki_guide.jpg'  WHERE id = 4;
UPDATE zones SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/darkroot_garden_walkthrough_dark_souls_remastered_wiki_guide.jpg' WHERE id = 5;
UPDATE zones SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/depths_walkthrough_dark_souls_remastered_wiki_guide.jpg'         WHERE id = 6;
UPDATE zones SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/blighttown_walkthrough_dark_souls_remastered_wiki_guide.jpg'     WHERE id = 7;
UPDATE zones SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/sens_fortress_walkthrough_dark_souls_remastered_wiki_guide.jpg'  WHERE id = 8;
UPDATE zones SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/anor_londo_walkthrough_dark_souls_remastered_wiki_guide.jpg'     WHERE id = 9;
UPDATE zones SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/tomb_of_giants_walkthrough_dark_souls_remastered_wiki_guide.jpg' WHERE id = 10;
UPDATE zones SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/demon_ruins_walkthrough_dark_souls_remastered_wiki_guide.jpg'    WHERE id = 11;
UPDATE zones SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/lost_izalith_walkthrough_dark_souls_remastered_wiki_guide.jpg'   WHERE id = 12;
UPDATE zones SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/dukes_archives_walkthrough_dark_souls_remastered_wiki_guide.jpg' WHERE id = 13;
UPDATE zones SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/crystal_cave_walkthrough_dark_souls_remastered_wiki_guide.jpg'   WHERE id = 14;
UPDATE zones SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/the_catacombs_walkthrough_dark_souls_remastered_wiki_guide.jpg'  WHERE id = 15;
UPDATE zones SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/new_londo_ruins_walkthrough_dark_souls_remastered_wiki_guide.jpg' WHERE id = 16;
UPDATE zones SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/kiln_of_the_first_flame_walkthrough_dark_souls_remastered_wiki_guide.jpg' WHERE id = 17;

-- ── DS1 BOSS IMAGES ──────────────────────────
-- Boss numbers confirmed from fextralife.com/Bosses index page
UPDATE bosses SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/Boss_0036_Asylum Demon.jpg'           WHERE id = 1;
UPDATE bosses SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/Boss_0015_Taurus Demon.jpg'           WHERE id = 2;
UPDATE bosses SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/ubd_dragon.jpg'                       WHERE id = 3;
UPDATE bosses SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/Boss_0035_Bell Gargoyle.jpg'          WHERE id = 4;
UPDATE bosses SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/Boss_0026_Gaping Dragon.jpg'          WHERE id = 5;
UPDATE bosses SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/Boss_0031_Chaos Witch Quelaag.jpg'    WHERE id = 6;
UPDATE bosses SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/Boss_0023_Iron Golem.jpg'             WHERE id = 7;
UPDATE bosses SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/Boss_0020_Ornstein & Smough.jpg'      WHERE id = 8;
UPDATE bosses SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/Boss_0029_Dark Sun Gwyndolin.jpg'     WHERE id = 9;
UPDATE bosses SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/Boss_0022_Moonlight Butterfly.jpg'    WHERE id = 10;
UPDATE bosses SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/Boss_0025_Great Greywolf Sif.jpg'     WHERE id = 11;
UPDATE bosses SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/Boss_0019_Pinwheel.jpg'               WHERE id = 12;
UPDATE bosses SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/Boss_0021_Nito.jpg'                   WHERE id = 13;
UPDATE bosses SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/Boss_0027_Four Kings.jpg'             WHERE id = 14;
UPDATE bosses SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/Boss_0016_Bed of Chaos.jpg'           WHERE id = 15;
UPDATE bosses SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/Boss_0018_Seath the Scaleless.jpg'    WHERE id = 16;
UPDATE bosses SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/Boss_0024_Gwyn Lord of Cinder.jpg'    WHERE id = 17;

-- ── DS1 GAME CARD ─────────────────────────────
-- Anor Londo as the hero shot — the most iconic vista in DS1
UPDATE games SET image_url = 'https://darksouls.wiki.fextralife.com/file/Dark-Souls/anor_londo_walkthrough_dark_souls_remastered_wiki_guide.jpg' WHERE id = 1;
