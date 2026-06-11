-- =============================================
-- DARK SOULS PATHFINDER — Local Image Paths
-- Updates ALL image_url values to local paths
-- Naming: lowercase, underscores, no apostrophes
-- Run in DBeaver against defaultdb
-- =============================================

-- ── GAMES ────────────────────────────────────
UPDATE games SET image_url = '/assets/images/games/ds1.jpg' WHERE slug = 'ds1';
UPDATE games SET image_url = '/assets/images/games/ds2.jpg' WHERE slug = 'ds2';
UPDATE games SET image_url = '/assets/images/games/ds3.jpg' WHERE slug = 'ds3';

-- ── DS1 ZONES ────────────────────────────────
UPDATE zones SET image_url = '/assets/images/zones/ds1/undead_asylum.jpg'          WHERE id = 1;
UPDATE zones SET image_url = '/assets/images/zones/ds1/firelink_shrine.jpg'        WHERE id = 2;
UPDATE zones SET image_url = '/assets/images/zones/ds1/undead_burg.jpg'            WHERE id = 3;
UPDATE zones SET image_url = '/assets/images/zones/ds1/undead_parish.jpg'          WHERE id = 4;
UPDATE zones SET image_url = '/assets/images/zones/ds1/darkroot_garden.jpg'        WHERE id = 5;
UPDATE zones SET image_url = '/assets/images/zones/ds1/depths.jpg'                 WHERE id = 6;
UPDATE zones SET image_url = '/assets/images/zones/ds1/blighttown.jpg'             WHERE id = 7;
UPDATE zones SET image_url = '/assets/images/zones/ds1/sens_fortress.jpg'          WHERE id = 8;
UPDATE zones SET image_url = '/assets/images/zones/ds1/anor_londo.jpg'             WHERE id = 9;
UPDATE zones SET image_url = '/assets/images/zones/ds1/tomb_of_giants.jpg'         WHERE id = 10;
UPDATE zones SET image_url = '/assets/images/zones/ds1/demon_ruins.jpg'            WHERE id = 11;
UPDATE zones SET image_url = '/assets/images/zones/ds1/lost_izalith.jpg'           WHERE id = 12;
UPDATE zones SET image_url = '/assets/images/zones/ds1/dukes_archives.jpg'         WHERE id = 13;
UPDATE zones SET image_url = '/assets/images/zones/ds1/crystal_cave.jpg'           WHERE id = 14;
UPDATE zones SET image_url = '/assets/images/zones/ds1/the_catacombs.jpg'          WHERE id = 15;
UPDATE zones SET image_url = '/assets/images/zones/ds1/new_londo_ruins.jpg'        WHERE id = 16;
UPDATE zones SET image_url = '/assets/images/zones/ds1/kiln_of_the_first_flame.jpg' WHERE id = 17;

-- ── DS1 BOSSES ───────────────────────────────
UPDATE bosses SET image_url = '/assets/images/bosses/ds1/asylum_demon.jpg'            WHERE id = 1;
UPDATE bosses SET image_url = '/assets/images/bosses/ds1/taurus_demon.jpg'            WHERE id = 2;
UPDATE bosses SET image_url = '/assets/images/bosses/ds1/hellkite_drake.jpg'          WHERE id = 3;
UPDATE bosses SET image_url = '/assets/images/bosses/ds1/bell_gargoyle.jpg'           WHERE id = 4;
UPDATE bosses SET image_url = '/assets/images/bosses/ds1/gaping_dragon.jpg'           WHERE id = 5;
UPDATE bosses SET image_url = '/assets/images/bosses/ds1/chaos_witch_quelaag.jpg'     WHERE id = 6;
UPDATE bosses SET image_url = '/assets/images/bosses/ds1/iron_golem.jpg'              WHERE id = 7;
UPDATE bosses SET image_url = '/assets/images/bosses/ds1/ornstein_and_smough.jpg'     WHERE id = 8;
UPDATE bosses SET image_url = '/assets/images/bosses/ds1/gwyndolin.jpg'               WHERE id = 9;
UPDATE bosses SET image_url = '/assets/images/bosses/ds1/moonlight_butterfly.jpg'     WHERE id = 10;
UPDATE bosses SET image_url = '/assets/images/bosses/ds1/sif_the_great_grey_wolf.jpg' WHERE id = 11;
UPDATE bosses SET image_url = '/assets/images/bosses/ds1/pinwheel.jpg'                WHERE id = 12;
UPDATE bosses SET image_url = '/assets/images/bosses/ds1/gravelord_nito.jpg'          WHERE id = 13;
UPDATE bosses SET image_url = '/assets/images/bosses/ds1/four_kings.jpg'              WHERE id = 14;
UPDATE bosses SET image_url = '/assets/images/bosses/ds1/bed_of_chaos.jpg'            WHERE id = 15;
UPDATE bosses SET image_url = '/assets/images/bosses/ds1/seath_the_scaleless.jpg'     WHERE id = 16;
UPDATE bosses SET image_url = '/assets/images/bosses/ds1/gwyn_lord_of_cinder.jpg'     WHERE id = 17;

-- ── DS2 ZONES ────────────────────────────────
UPDATE zones SET image_url = '/assets/images/zones/ds2/things_betwixt.jpg'            WHERE id = 18;
UPDATE zones SET image_url = '/assets/images/zones/ds2/majula.jpg'                    WHERE id = 19;
UPDATE zones SET image_url = '/assets/images/zones/ds2/forest_of_fallen_giants.jpg'   WHERE id = 20;
UPDATE zones SET image_url = '/assets/images/zones/ds2/heides_tower_of_flame.jpg'     WHERE id = 21;
UPDATE zones SET image_url = '/assets/images/zones/ds2/no_mans_wharf.jpg'             WHERE id = 22;
UPDATE zones SET image_url = '/assets/images/zones/ds2/the_lost_bastille.jpg'         WHERE id = 23;
UPDATE zones SET image_url = '/assets/images/zones/ds2/sinners_rise.jpg'              WHERE id = 24;
UPDATE zones SET image_url = '/assets/images/zones/ds2/huntsmans_copse.jpg'           WHERE id = 25;
UPDATE zones SET image_url = '/assets/images/zones/ds2/harvest_valley.jpg'            WHERE id = 26;
UPDATE zones SET image_url = '/assets/images/zones/ds2/earthen_peak.jpg'              WHERE id = 27;
UPDATE zones SET image_url = '/assets/images/zones/ds2/iron_keep.jpg'                 WHERE id = 28;
UPDATE zones SET image_url = '/assets/images/zones/ds2/shaded_woods.jpg'              WHERE id = 29;
UPDATE zones SET image_url = '/assets/images/zones/ds2/drangleic_castle.jpg'          WHERE id = 30;
UPDATE zones SET image_url = '/assets/images/zones/ds2/shrine_of_amana.jpg'           WHERE id = 31;
UPDATE zones SET image_url = '/assets/images/zones/ds2/undead_crypt.jpg'              WHERE id = 32;
UPDATE zones SET image_url = '/assets/images/zones/ds2/black_gulch.jpg'               WHERE id = 33;
UPDATE zones SET image_url = '/assets/images/zones/ds2/brightstone_cove_tseldora.jpg' WHERE id = 34;
UPDATE zones SET image_url = '/assets/images/zones/ds2/throne_of_want.jpg'            WHERE id = 35;

-- ── DS2 BOSSES ───────────────────────────────
UPDATE bosses SET image_url = '/assets/images/bosses/ds2/the_last_giant.jpg'                WHERE id = 18;
UPDATE bosses SET image_url = '/assets/images/bosses/ds2/the_pursuer.jpg'                   WHERE id = 19;
UPDATE bosses SET image_url = '/assets/images/bosses/ds2/dragonrider.jpg'                   WHERE id = 20;
UPDATE bosses SET image_url = '/assets/images/bosses/ds2/old_dragonslayer.jpg'              WHERE id = 21;
UPDATE bosses SET image_url = '/assets/images/bosses/ds2/flexile_sentry.jpg'                WHERE id = 22;
UPDATE bosses SET image_url = '/assets/images/bosses/ds2/ruin_sentinels.jpg'                WHERE id = 23;
UPDATE bosses SET image_url = '/assets/images/bosses/ds2/belfry_gargoyles.jpg'              WHERE id = 24;
UPDATE bosses SET image_url = '/assets/images/bosses/ds2/lost_sinner.jpg'                   WHERE id = 25;
UPDATE bosses SET image_url = '/assets/images/bosses/ds2/skeleton_lords.jpg'                WHERE id = 26;
UPDATE bosses SET image_url = '/assets/images/bosses/ds2/covetous_demon.jpg'                WHERE id = 27;
UPDATE bosses SET image_url = '/assets/images/bosses/ds2/mytha_the_baneful_queen.jpg'       WHERE id = 28;
UPDATE bosses SET image_url = '/assets/images/bosses/ds2/smelter_demon.jpg'                 WHERE id = 29;
UPDATE bosses SET image_url = '/assets/images/bosses/ds2/old_iron_king.jpg'                 WHERE id = 30;
UPDATE bosses SET image_url = '/assets/images/bosses/ds2/scorpioness_najka.jpg'             WHERE id = 31;
UPDATE bosses SET image_url = '/assets/images/bosses/ds2/prowling_magus_and_congregation.jpg' WHERE id = 32;
UPDATE bosses SET image_url = '/assets/images/bosses/ds2/dukes_dear_freja.jpg'              WHERE id = 33;
UPDATE bosses SET image_url = '/assets/images/bosses/ds2/the_rotten.jpg'                    WHERE id = 34;
UPDATE bosses SET image_url = '/assets/images/bosses/ds2/demon_of_song.jpg'                 WHERE id = 35;
UPDATE bosses SET image_url = '/assets/images/bosses/ds2/velstadt_the_royal_aegis.jpg'      WHERE id = 36;
UPDATE bosses SET image_url = '/assets/images/bosses/ds2/vendrick.jpg'                      WHERE id = 37;
UPDATE bosses SET image_url = '/assets/images/bosses/ds2/throne_watcher_and_throne_defender.jpg' WHERE id = 38;
UPDATE bosses SET image_url = '/assets/images/bosses/ds2/nashandra.jpg'                     WHERE id = 39;

-- ── DS3 ZONES ────────────────────────────────
UPDATE zones SET image_url = '/assets/images/zones/ds3/cemetery_of_ash.jpg'              WHERE id = 36;
UPDATE zones SET image_url = '/assets/images/zones/ds3/firelink_shrine.jpg'              WHERE id = 37;
UPDATE zones SET image_url = '/assets/images/zones/ds3/high_wall_of_lothric.jpg'         WHERE id = 38;
UPDATE zones SET image_url = '/assets/images/zones/ds3/undead_settlement.jpg'            WHERE id = 39;
UPDATE zones SET image_url = '/assets/images/zones/ds3/road_of_sacrifices.jpg'           WHERE id = 40;
UPDATE zones SET image_url = '/assets/images/zones/ds3/cathedral_of_the_deep.jpg'        WHERE id = 41;
UPDATE zones SET image_url = '/assets/images/zones/ds3/farron_keep.jpg'                  WHERE id = 42;
UPDATE zones SET image_url = '/assets/images/zones/ds3/catacombs_of_carthus.jpg'         WHERE id = 43;
UPDATE zones SET image_url = '/assets/images/zones/ds3/smouldering_lake.jpg'             WHERE id = 44;
UPDATE zones SET image_url = '/assets/images/zones/ds3/irithyll_of_the_boreal_valley.jpg' WHERE id = 45;
UPDATE zones SET image_url = '/assets/images/zones/ds3/irithyll_dungeon.jpg'             WHERE id = 46;
UPDATE zones SET image_url = '/assets/images/zones/ds3/profaned_capital.jpg'             WHERE id = 47;
UPDATE zones SET image_url = '/assets/images/zones/ds3/anor_londo.jpg'                   WHERE id = 48;
UPDATE zones SET image_url = '/assets/images/zones/ds3/lothric_castle.jpg'               WHERE id = 49;
UPDATE zones SET image_url = '/assets/images/zones/ds3/grand_archives.jpg'               WHERE id = 50;
UPDATE zones SET image_url = '/assets/images/zones/ds3/untended_graves.jpg'              WHERE id = 51;
UPDATE zones SET image_url = '/assets/images/zones/ds3/archdragon_peak.jpg'              WHERE id = 52;
UPDATE zones SET image_url = '/assets/images/zones/ds3/kiln_of_the_first_flame.jpg'      WHERE id = 53;

-- ── DS3 BOSSES ───────────────────────────────
UPDATE bosses SET image_url = '/assets/images/bosses/ds3/iudex_gundyr.jpg'               WHERE id = 40;
UPDATE bosses SET image_url = '/assets/images/bosses/ds3/vordt_of_the_boreal_valley.jpg' WHERE id = 41;
UPDATE bosses SET image_url = '/assets/images/bosses/ds3/curse_rotted_greatwood.jpg'     WHERE id = 42;
UPDATE bosses SET image_url = '/assets/images/bosses/ds3/crystal_sage.jpg'               WHERE id = 43;
UPDATE bosses SET image_url = '/assets/images/bosses/ds3/deacons_of_the_deep.jpg'        WHERE id = 44;
UPDATE bosses SET image_url = '/assets/images/bosses/ds3/abyss_watchers.jpg'             WHERE id = 45;
UPDATE bosses SET image_url = '/assets/images/bosses/ds3/high_lord_wolnir.jpg'           WHERE id = 46;
UPDATE bosses SET image_url = '/assets/images/bosses/ds3/old_demon_king.jpg'             WHERE id = 47;
UPDATE bosses SET image_url = '/assets/images/bosses/ds3/pontiff_sulyvahn.jpg'           WHERE id = 48;
UPDATE bosses SET image_url = '/assets/images/bosses/ds3/aldrich_devourer_of_gods.jpg'   WHERE id = 49;
UPDATE bosses SET image_url = '/assets/images/bosses/ds3/yhorm_the_giant.jpg'            WHERE id = 50;
UPDATE bosses SET image_url = '/assets/images/bosses/ds3/dancer_of_the_boreal_valley.jpg' WHERE id = 51;
UPDATE bosses SET image_url = '/assets/images/bosses/ds3/dragonslayer_armour.jpg'        WHERE id = 52;
UPDATE bosses SET image_url = '/assets/images/bosses/ds3/oceiros_the_consumed_king.jpg'  WHERE id = 53;
UPDATE bosses SET image_url = '/assets/images/bosses/ds3/champion_gundyr.jpg'            WHERE id = 54;
UPDATE bosses SET image_url = '/assets/images/bosses/ds3/ancient_wyvern.jpg'             WHERE id = 55;
UPDATE bosses SET image_url = '/assets/images/bosses/ds3/the_nameless_king.jpg'          WHERE id = 56;
UPDATE bosses SET image_url = '/assets/images/bosses/ds3/princes_lothric_and_lorian.jpg' WHERE id = 57;
UPDATE bosses SET image_url = '/assets/images/bosses/ds3/soul_of_cinder.jpg'             WHERE id = 58;
