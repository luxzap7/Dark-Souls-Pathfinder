-- =============================================
-- DARK SOULS PATHFINDER — Seed Data
-- Run AFTER schema.sql in Aiven Query Editor
-- =============================================

-- ── GAMES ───────────────────────────────────
INSERT INTO games (slug, title, subtitle, description, image_url, is_active) VALUES
('ds1', 'Dark Souls', 'Prepare to Die Edition / Remastered',
 'The original Dark Souls. Journey through the cursed land of Lordran, from the Undead Asylum to the Kiln of the First Flame. A game of patience, precision, and hard-won triumph.',
 '/assets/images/game_1_placeholder.svg', TRUE),
('ds2', 'Dark Souls II', 'Scholar of the First Sin',
 'A new curse, a new journey. Travel to Drangleic and seek the four Great Souls. Coming soon to Pathfinder.',
 '/assets/images/game_2_placeholder.svg', FALSE),
('ds3', 'Dark Souls III', 'The Fire Fades Edition',
 'The flame fades and the world darkens. Journey to the end of the Age of Fire. Coming soon to Pathfinder.',
 '/assets/images/game_3_placeholder.svg', FALSE);

-- ── DS1 ZONES ───────────────────────────────
INSERT INTO zones (id, game_id, name, description, image_url, lore, sort_order) VALUES
(1, 1, 'Undead Asylum',
 'The crumbling prison where your journey begins. Damp cells, hollow guards, and a silent knight who sets you free.',
 '/assets/images/placeholder.svg',
 'The Undead Asylum serves as a holding facility for the Undead — those afflicted with the Darksign who cannot truly die. When Oscar of Astora descended from above to free you, he had already been mortally wounded by Hollows. His final act was to pass on the Estus Flask and point you toward Lordran.',
 1),
(2, 1, 'Firelink Shrine',
 'The central hub of Lordran. A bonfire of peculiar warmth, a crestfallen knight who has given up, and the first quiet breath before the storm.',
 '/assets/images/placeholder.svg',
 'Firelink Shrine is a ruined fire-keeper chamber built around a peculiar bonfire. The Fire Keeper who tended it was stripped of her eyes and imprisoned — yet the bonfire burns. It sits at a crossroads between the Undead Burg, the catacombs, and the depths.',
 2),
(3, 1, 'Undead Burg',
 'A labyrinth of crumbling bridges and paranoid hollows. Crossbow bolts rain from parapets and a fire-breathing drake guards the bridge ahead.',
 '/assets/images/placeholder.svg',
 'The Undead Burg was once a prosperous market district of Lordran. When the curse of the undead spread, its citizens went hollow and it became a gauntlet of traps and territorial warriors. The Taurus Demon claimed the gatehouse tower, while a Hellkite Drake nested on the great bridge.',
 3),
(4, 1, 'Undead Parish',
 'A bell tower rises above a church of hollows. Knights in rusted armour patrol the fog-filled nave where a sleeping giant waits.',
 '/assets/images/placeholder.svg',
 'The Undead Parish was the site of a great cathedral dedicated to Gwyn''s firstborn. Now it lies in ruin, occupied by Hollow Knights. The Bell Gargoyles atop the bell tower must be slain before the first Bell of Awakening can ring — one of two bells needed to open the path forward.',
 4),
(5, 1, 'Darkroot Garden',
 'An ancient woodland overrun by nature''s dark will. Stone knights patrol moss-covered paths and the forest itself seems to watch.',
 '/assets/images/placeholder.svg',
 'Darkroot Garden surrounds the ruins of Oolacile, a lost city of antiquity. The magic of Seath the Scaleless mutated the flora into predatory creatures. The Moonlight Butterfly haunts a stone bridge deep within. Nearby, the grave of Artorias the Abysswalker stands.',
 5),
(6, 1, 'Depths',
 'The sewers beneath Lordran. Rats, basilisks that curse with their breath, and darkness deeper than it should be.',
 '/assets/images/placeholder.svg',
 'The Depths are an ancient sewer network beneath Lordran. Basilisks nest in the flooded chambers — their false eyes emit a curse mist that can Hollow a warrior in an instant. The Gaping Dragon, a once-normal dragon so consumed by hunger it split its torso into a massive maw, dwells at the bottom.',
 6),
(7, 1, 'Blighttown',
 'A festering swamp at the base of the world. Toxic darts from scaffolding above, poison bog below.',
 '/assets/images/placeholder.svg',
 'Blighttown is built upon the refuse of Lordran — a slum of rotting wood platforms descending into a poisonous swamp. The second Bell of Awakening is located here, guarded by Quelaag, daughter of the Witch of Izalith. The swamp connects to Ash Lake and the Great Hollow.',
 7),
(8, 1, 'Sen''s Fortress',
 'A trap-filled iron gauntlet built to test those who seek Anor Londo. Boulders roll. Pendulums swing.',
 '/assets/images/placeholder.svg',
 'Sen''s Fortress was constructed as a proving ground for those deemed worthy to enter Anor Londo. Its architect was likely the serpent-men who still inhabit it. Iron Giants guard the gate. The fortress is riddled with pitfall floors, swinging blades, and cascading boulders.',
 8),
(9, 1, 'Anor Londo',
 'The city of the gods, gleaming in eternal false sunlight. Towering architecture, silver knights, and awe.',
 '/assets/images/placeholder.svg',
 'Anor Londo was the seat of Gwyn''s power — a magnificent city of cathedrals and palaces above the clouds. After Gwyn left to link the First Flame, Gwyndolin used illusion magic to maintain the appearance of life, including a false sunlight. The cathedral holds Ornstein and Smough, the last defenders.',
 9),
(10, 1, 'Tomb of Giants',
 'Total darkness. The graves of ancient giants, skeletons that hit like boulders, and profound wrongness.',
 '/assets/images/placeholder.svg',
 'The Tomb of Giants lies beneath the Catacombs — the burial ground of enormous creatures predating the Age of Fire. Nito, the First of the Dead, rests here surrounded by the miasma of death. The darkness is absolute unless you carry the Skull Lantern or the Sunlight Maggot helmet.',
 10),
(11, 1, 'Demon Ruins',
 'The charred remains of Izalith. Half-formed demons wander lava fields in a kingdom that burned itself to death.',
 '/assets/images/placeholder.svg',
 'The Demon Ruins are the outer reaches of the great city of Izalith. The Witch of Izalith attempted to recreate the First Flame using a Lord Soul — and failed catastrophically. The resulting Chaos Flame gave birth to demonic life. The ruins are a testament to hubris.',
 11),
(12, 1, 'Lost Izalith',
 'The deepest wound in the world. The Bed of Chaos sits where a city once stood.',
 '/assets/images/placeholder.svg',
 'Lost Izalith is the shattered heart of what was once the greatest city of sorcery. When the Witch of Izalith''s ritual failed, the city was consumed from within. Her body merged with the failed flame to become the Bed of Chaos — the mother of all demons.',
 12),
(13, 1, 'Duke''s Archives',
 'A vast library of crystalline corridors. Seath the Scaleless hoards stolen knowledge here.',
 '/assets/images/placeholder.svg',
 'The Duke''s Archives were granted to Seath the Scaleless by Gwyn. Seath is obsessed with immortality — the Primordial Crystal that grants him undying life also drives him mad. He experiments on captive humans and moonlight butterflies. The archives are a labyrinth of bookshelves and crystal soldiers.',
 13),
(14, 1, 'Crystal Cave',
 'Invisible walkways above an abyss. Seath waits at the end, babbling in madness.',
 '/assets/images/placeholder.svg',
 'The Crystal Cave is Seath''s inner sanctum. Invisible crystal platforms span the chasm — easy to fall from, impossible to see. Seath made a pact to betray dragonkind in exchange for the Primordial Crystal. Now immortal and insane, he attacks on sight.',
 14),
(15, 1, 'The Catacombs',
 'Endless tunnels of self-relighting skeletons and necromancers. Bring a divine weapon.',
 '/assets/images/placeholder.svg',
 'The Catacombs were dug beneath Firelink Shrine as a burial ground and domain of Nito. Necromancers loyal to Nito patrol the tunnels, constantly resurrecting the dead. A divine weapon can slay skeletons permanently. Pinwheel, who stole the power of Nito, guards the deeper chambers.',
 15),
(16, 1, 'New Londo Ruins',
 'A drowned city sealed for good reason. The Darkwraiths drain humanity on sight.',
 '/assets/images/placeholder.svg',
 'New Londo was flooded deliberately to contain the Darkwraiths — once the Four Kings'' elite guard, seduced by the Abyss and taught to steal humanity by Kaathe. To reach the Four Kings, you must drain the city and descend with the Covenant of Artorias ring.',
 16),
(17, 1, 'Kiln of the First Flame',
 'The end of the journey. Ash and silence. The First Flame flickers ahead.',
 '/assets/images/placeholder.svg',
 'The Kiln of the First Flame is where Gwyn journeyed alone to link the First Flame and prevent the Age of Dark. He has been burning ever since — hollow, without thought. Defeating him poses a choice: link the fire and prolong the Age of Fire, or walk away and usher in the Age of Dark.',
 17);

-- ── ZONE PREREQUISITES ──────────────────────
INSERT INTO zone_prerequisites VALUES (2,1);
INSERT INTO zone_prerequisites VALUES (3,2);
INSERT INTO zone_prerequisites VALUES (4,3);
INSERT INTO zone_prerequisites VALUES (5,4);
INSERT INTO zone_prerequisites VALUES (6,4);
INSERT INTO zone_prerequisites VALUES (7,6);
INSERT INTO zone_prerequisites VALUES (8,4);
INSERT INTO zone_prerequisites VALUES (8,7);
INSERT INTO zone_prerequisites VALUES (9,8);
INSERT INTO zone_prerequisites VALUES (10,15);
INSERT INTO zone_prerequisites VALUES (11,7);
INSERT INTO zone_prerequisites VALUES (12,11);
INSERT INTO zone_prerequisites VALUES (13,9);
INSERT INTO zone_prerequisites VALUES (14,13);
INSERT INTO zone_prerequisites VALUES (15,2);
INSERT INTO zone_prerequisites VALUES (16,2);
INSERT INTO zone_prerequisites VALUES (17,9);
INSERT INTO zone_prerequisites VALUES (17,10);
INSERT INTO zone_prerequisites VALUES (17,12);
INSERT INTO zone_prerequisites VALUES (17,16);

-- ── DS1 BOSSES ───────────────────────────────
INSERT INTO bosses (id, zone_id, name, description, image_url, lore, hp, souls_reward, weakness, resistance, location, sort_order) VALUES
(1, 1, 'Asylum Demon',
 'A massive demon guarding the exit of the Undead Asylum. Your first true test — a lesson in patience over brute force.',
 '/assets/images/placeholder.svg',
 'The Asylum Demon was placed to prevent the undead from escaping. It is a distant relative of the demons birthed from the Chaos Flame. Encountered first without equipment, you are taught that running is wisdom. Return fully armed and the fight becomes a lesson in managing a massive, slow enemy.',
 2972, 2000, 'Fire, Lightning', 'Poison, Bleed', 'Undead Asylum — main hall', 1),

(2, 3, 'Taurus Demon',
 'A horned, axe-wielding demon claiming the watchtower above the Undead Burg.',
 '/assets/images/placeholder.svg',
 'The Taurus Demon is one of the weaker demons spawned from the Chaos Flame — a territorial creature that claimed the Undead Burg gatehouse. Clever undead use the tower ladder to their advantage, plunging down onto the demon''s skull repeatedly.',
 2158, 3000, 'Fire, Lightning', 'Poison', 'Undead Burg — upper watchtower bridge', 1),

(3, 3, 'Hellkite Drake',
 'Not a true boss, but the red drake that burns the bridge is the first wall requiring lateral thinking.',
 '/assets/images/placeholder.svg',
 'The Hellkite Drake is a young everlasting dragon nesting on the great bridge. Unlike true dragons, it is mortal. Its tail can be severed to obtain the Drake Sword. Patient undead who wait in the alcove beneath the bridge can chip away at its tail safely.',
 2096, 1000, 'Lightning', 'Fire', 'Undead Burg — great bridge', 2),

(4, 4, 'Bell Gargoyle',
 'Two gargoyles atop the bell tower. One becomes two when you think the fight is nearly over.',
 '/assets/images/placeholder.svg',
 'The Bell Gargoyles were created as guardians of the Bell of Awakening. They are animated stone — built to endure. The fight is structured as a cruel lesson: defeat one with confidence, and a second descends at half health. Summoning Solaire is the first opportunity to appreciate cooperation in Lordran.',
 1453, 10000, 'Fire, Lightning', 'Bleed', 'Undead Parish — bell tower roof', 1),

(5, 6, 'Gaping Dragon',
 'A dragon so consumed by hunger its torso split into a vertical maw. It charges. It flails.',
 '/assets/images/placeholder.svg',
 'The Gaping Dragon was once a normal dragon — but insatiable hunger consumed it. Its torso split into a massive fanged maw. Cutting its tail rewards the Dragon King Greataxe. The Gaping Dragon is drawn to the scent of blood and will charge relentlessly.',
 2420, 25000, 'Lightning', 'Fire, Poison', 'Depths — lower flooded chamber', 1),

(6, 7, 'Chaos Witch Quelaag',
 'A spider-centaur of fire and malice. Daughter of the Witch of Izalith who managed to retain beauty — above the waist.',
 '/assets/images/placeholder.svg',
 'Quelaag is one of the daughters of the Witch of Izalith. When the Chaos Flame consumed Izalith she escaped — but her lower half became a great chaos spider. She guards the second Bell of Awakening. Her sister, the Fair Lady, is hidden beyond — ill, blind, and beloved by the Chaos Servant covenant.',
 8093, 20000, 'Lightning', 'Fire, Poison', 'Blighttown — swamp level fog gate', 1),

(7, 8, 'Iron Golem',
 'The guardian of Sen''s Fortress. Built of iron and ancient magic — stagger it near the edge.',
 '/assets/images/placeholder.svg',
 'The Iron Golem was constructed to guard the gate of Sen''s Fortress against the unworthy. It is a masterpiece of ancient craftsmanship powered by the core of an iron golem soul. The roof arena is narrow — the golem''s staggering animations can send it toppling off the edge for a quick victory.',
 2880, 40000, 'Lightning, Fire', 'Poison, Bleed', 'Sen''s Fortress — rooftop', 1),

(8, 9, 'Dragon Slayer Ornstein & Executioner Smough',
 'The most famous duo in Souls history. A nimble spear-knight and a ponderous hammer-executioner.',
 '/assets/images/placeholder.svg',
 'Ornstein and Smough are the last of Gwyn''s knights remaining in Anor Londo. Ornstein was captain of the Four Knights — agile and empowered by lightning. Smough was denied knighthood despite his power. The order in which you slay them determines which power the survivor absorbs.',
 3331, 50000, 'Lightning (Smough), Fire (Ornstein)', 'Bleed, Poison', 'Anor Londo — cathedral', 1),

(9, 9, 'Gwyndolin',
 'An optional deity maintaining Anor Londo''s illusions. Fought in a corridor that stretches impossibly.',
 '/assets/images/placeholder.svg',
 'Gwyndolin is the youngest child of Gwyn, raised in the ways of the moon. Gwyndolin maintains the illusion of sunlight in Anor Londo. The boss arena is a hall of mirrors extending infinitely backward. Killing Gwyndolin removes Gwynevere''s illusion and plunges Anor Londo into true darkness.',
 2407, 40000, 'Fire, Bleed', 'Lightning', 'Anor Londo — tomb beneath the cathedral', 2),

(10, 5, 'Moonlight Butterfly',
 'A creature of crystal and sorcery drifting above a stone bridge. It rarely lands. Bring a bow.',
 '/assets/images/placeholder.svg',
 'The Moonlight Butterfly is one of Seath''s creations — a being of pure moonlight crystal. It haunts a stone bridge in Darkroot Garden, landing only briefly. Many find it frustrating as it spends most of the fight hovering out of melee range. Its soul can be transposed into a powerful sorcery catalyst.',
 2168, 40000, 'Lightning, Dark', 'Magic, Fire', 'Darkroot Garden — stone bridge', 1),

(11, 5, 'Sif, the Great Grey Wolf',
 'The most heartbreaking fight in Lordran. A great wolf protecting its fallen master''s grave. It limps at low health.',
 '/assets/images/placeholder.svg',
 'Sif is the loyal companion of Artorias the Abysswalker. When you enter the fog gate, Sif fights desperately — and at low health, begins to limp, swinging Artorias''s great sword with faltering steps. Killing Sif unlocks the Covenant of Artorias ring, essential for entering the Abyss.',
 3952, 40000, 'Fire, Lightning', 'Magic', 'Darkroot Garden — grave of Artorias', 2),

(12, 15, 'Pinwheel',
 'The easiest boss in the game — a necromancer wearing three masks who creates copies of himself.',
 '/assets/images/placeholder.svg',
 'Pinwheel stole the power of Nito, the First of the Dead, and wears three masks representing his deceased family. Despite his lore importance, he is universally regarded as the weakest boss in the game. His mask drops are some of the most unusual in Dark Souls.',
 1900, 15000, 'Fire, Lightning', 'Dark', 'Catacombs — lower chamber', 1),

(13, 10, 'Gravelord Nito',
 'The First of the Dead. He rises from a pit of bones in near-total darkness.',
 '/assets/images/placeholder.svg',
 'Nito was one of the primordial beings who discovered the First Flame and claimed a Lord Soul of death. He is a mass of bodies fused together, wielding a greatsword. The arena is littered with ancient giant bones that animate during the fight. He spreads a death miasma that continuously damages.',
 10240, 60000, 'Fire, Lightning', 'Dark, Poison', 'Tomb of Giants — pit of the dead', 1),

(14, 16, 'Four Kings',
 'Four spectral kings attacking in sequence — summon the next before you finish the last.',
 '/assets/images/placeholder.svg',
 'The Four Kings were once rulers of New Londo, gifted with fragments of Gwyn''s Lord Soul. Kaathe tempted them with the power of the Abyss, and they fell. Each king spawns if the previous one is not killed quickly enough, making the fight a pure DPS race against time.',
 9036, 60000, 'Lightning', 'Magic, Dark', 'New Londo Ruins — the Abyss', 1),

(15, 12, 'Bed of Chaos',
 'The failed ritual at the heart of Izalith. No health bar — just a platform puzzle with deadly consequences.',
 '/assets/images/placeholder.svg',
 'The Bed of Chaos is what remains of the Witch of Izalith after her attempt to recreate the First Flame consumed her. The fight is unlike any other — not a damage race but a navigation puzzle. Two appendages guard flame nodes on either side. Destroying both, then reaching the centre root, completes the fight.',
 1, 60000, 'Fire, Lightning', 'Magic', 'Lost Izalith — heart of the ruins', 1),

(16, 13, 'Seath the Scaleless',
 'The mad librarian dragon. Immortal, crystalline, ranting at his experiments. Destroy the crystal first.',
 '/assets/images/placeholder.svg',
 'Seath was born without the stone scales granting dragons immortality — driving him to treachery. He betrayed dragonkind to Gwyn and received the Primordial Crystal in return. He is fought twice — the first encounter is unwinnable. The second can only be won by destroying the Primordial Crystal first.',
 18664, 60000, 'Lightning, Bleed', 'Magic', 'Crystal Cave — inner sanctum', 1),

(17, 17, 'Gwyn, Lord of Cinder',
 'The final guardian of the First Flame. A once-great god, hollow and burning, attacking with furious speed.',
 '/assets/images/placeholder.svg',
 'Gwyn, Lord of Sunlight, was the most powerful being in the Age of Fire. When the flame began to fade, he linked himself to it — sacrificing his mind and dignity to prolong the Age of Fire. He has been burning alone ever since, an empty husk. Parrying him repeatedly is the most effective and poignant strategy.',
 3356, 70000, 'Lightning, Fire', 'Bleed', 'Kiln of the First Flame — altar chamber', 1);
