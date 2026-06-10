-- =============================================
-- DARK SOULS PATHFINDER — DS3 Seed Data
-- The Fire Fades Edition
-- Run AFTER schema.sql, seed.sql, seed_ds2.sql
-- Uses defaultdb — no CREATE DATABASE / USE
-- DS3 zone IDs: 36–53  |  boss IDs: 40–58
-- =============================================

-- ── DS3 ZONES ────────────────────────────────
INSERT INTO zones (id, game_id, name, description, image_url, lore, sort_order) VALUES

(36, 3, 'Cemetery of Ash',
 'The first sight of Lothric. A grey cemetery shrouded in ash where Unkindled dead rise from their graves to begin the journey anew.',
 '/assets/images/placeholder.svg',
 'The Cemetery of Ash is the resting place of the Unkindled — those who were unable to link the First Flame in their time and were reduced to ash. When the bells toll and the Lords of Cinder abandon their thrones, the Unkindled are called back from death to serve as their replacements. The cemetery sits at the threshold of Firelink Shrine, a quiet graveyard lit only by dying embers and the faint glow of a bonfire at its far end. A coiled sword marks the grave of the gatekeeper who waits to judge the first arrivals.',
 1),

(37, 3, 'Firelink Shrine',
 'The hub of the journey. A ruined shrine at the top of a cliff, tended by a Fire Keeper who sees with closed eyes and speaks to the dying flame.',
 '/assets/images/placeholder.svg',
 'Firelink Shrine stands atop a great cliff overlooking the kingdom of Lothric. The Fire Keeper tends the bonfire in silence, stripped of her sight to better perceive the flame. Unlike the Firelink Shrine of Lordran, this one is largely hollow — its priests and knights long departed. The Bell Tower beyond the shrine holds three Fire Keeper Souls. A hidden passage beneath leads to the Untended Graves — a dark mirror of the shrine from a time when the fire has already gone out and no keeper remains.',
 2),

(38, 3, 'High Wall of Lothric',
 'The outer walls of the kingdom, teeming with hollow soldiers and crucified figures. A Pus of Man erupts from those who have lingered too long in the curse.',
 '/assets/images/placeholder.svg',
 'The High Wall of Lothric is the first great barrier of the kingdom, built to separate the castle from the lands below. When the Undead curse spread through Lothric, the wall became a quarantine zone — soldiers went hollow at their posts, and the infected were crucified on the parapets as a gesture of futile containment. Emma, the high priestess of Lothric, sends the Unkindled here with a mission: find the Lords of Cinder and return them to their thrones. The Pus of Man — a dark, tentacled growth — erupts from those who have lingered too long in the curse.',
 3),

(39, 3, 'Undead Settlement',
 'A cliff-side village of wretched hollows, dangling cages, and a colossal ancient tree worshipped by those who were forgotten.',
 '/assets/images/placeholder.svg',
 'The Undead Settlement is a ramshackle village built on the cliffs below Lothric where the undead were sent to be forgotten. The hollow villagers worship the Curse-Rotted Greatwood, a colossal tree infested with white birch saplings grown from the souls of buried undead. Mound-Makers lurk here, harvesting vertebra shackles from the fallen. Siegward of Catarina descends into a well, confused and cheerful as ever. A friendly giant named Andre — not the blacksmith — watches over the settlement from a ruined tower, and will aid those who earn his trust.',
 4),

(40, 3, 'Road of Sacrifices',
 'A muddy road through a dark forest where the sacrificed hang from trees. It forks toward two very different fates: the Cathedral and the Keep.',
 '/assets/images/placeholder.svg',
 'The Road of Sacrifices cuts through the swamps and dark woodlands between the Undead Settlement and the two great mid-game regions. Crystal Sage retreats through the forest, teleporting ahead of pursuers and dropping illusory copies to confuse. Great Crabs lurk in the boggy margins. The road forks here — to the left, the Cathedral of the Deep; to the right, Farron Keep. Both paths lead to Lords of Cinder, but through very different trials.',
 5),

(41, 3, 'Cathedral of the Deep',
 'A vast cathedral overrun by giants and hollowed deacons who worship something immense and hungry in the crypt below.',
 '/assets/images/placeholder.svg',
 'The Cathedral of the Deep was built to house and venerate Aldrich, Saint of the Deep — a cleric who discovered that devouring souls granted great power and never stopped consuming until he became a vast, sludge-like aberration. The cathedral''s deacons tended to him as he grew, and eventually followed him into hollow consumption. Rosaria''s Fingers operate in the chambers above. The architecture is deliberately overwhelming — soaring buttresses, flooded crypts, massive gates — a monument to something that should never have been worshipped.',
 6),

(42, 3, 'Farron Keep',
 'A poisonous swamp surrounding a crumbling fortress where the undead Abyss Watchers were sealed away, still fighting each other centuries later.',
 '/assets/images/placeholder.svg',
 'Farron Keep was the home of the Undead Legion of Farron — the Abyss Watchers, a company of warriors who trained under techniques descended from Artorias the Abysswalker to hunt creatures of the Abyss. When the Abyss grew too strong within them — the wolf blood they drank to fight the Abyss turning against them — they sealed themselves inside the keep rather than let the darkness spread. They now fight each other endlessly, animated by the same blood that binds them, unable to die and unable to stop.',
 7),

(43, 3, 'Catacombs of Carthus',
 'A vast underground labyrinth of bones and rolling skull traps built by the warriors of Carthus — those who sought strength through conquest and won only death.',
 '/assets/images/placeholder.svg',
 'The Catacombs of Carthus are the burial grounds of the High Lord Wolnir and his kingdom of Carthus, which conquered countless lands through force of will and sheer martial skill. Wolnir himself sought to conquer death — performing rituals that drew the Abyss into his very bones. He clings to three golden bracelets that hold the Abyss at bay; their destruction is the key to ending him. Sword Master Horace the Hushed and Anri of Astora pursue their own pilgrimage through these passages.',
 8),

(44, 3, 'Smouldering Lake',
 'A subterranean lake of cooling lava lit by a giant ballista bolt that fires endlessly from the ruins above. The last of the demon lords smoulders here.',
 '/assets/images/placeholder.svg',
 'Smouldering Lake is a vast underground chamber that was once part of the great demon civilisation. A colossal ballista in the ruins fires endlessly into the lake floor — a relic of some ancient siege. The Old Demon King, last sovereign of a dying race, sits at the final ember of the Chaos Flame, keeping it alive through body heat and will alone. The Carthus Sandworm tunnels beneath the lava. Without the Chaos Flame the demon people will cease to exist entirely.',
 9),

(45, 3, 'Irithyll of the Boreal Valley',
 'A breathtaking frozen city of pale blue light and white bone architecture. Beautiful, dangerous, and ruled by Pontiff Sulyvahn''s fear.',
 '/assets/images/placeholder.svg',
 'Irithyll is a city of eternal winter built in devotion to the moon and Gwyndolin. Pontiff Sulyvahn — a sorcerer who rose from the Painted World of Ariandel to seize power through treachery — rules from the Anor Londo above. He bound his Outrider Knights with cursed rings that cause unbearable agony when removed, ensuring loyalty through pain rather than devotion. Dorhys the Dungeon Warden and the Aldrich Faithful patrol these moonlit streets. Siegward of Catarina, improbably, sleeps in the kitchen.',
 10),

(46, 3, 'Irithyll Dungeon',
 'A colossal prison carved into the cliffs beneath Irithyll. The Jailers here drain the life-force from prisoners with their gaze alone.',
 '/assets/images/placeholder.svg',
 'The Irithyll Dungeon was built to confine those deemed too dangerous or too broken to serve Pontiff Sulyvahn''s designs. The Jailers were constructed to wither the essence of prisoners — their gaze physically reduces maximum HP, a mechanic born of the deep fear that the undead cannot truly be contained. Karla the Witch is imprisoned here, surrounded by heretical texts. The cells are enormous, suggesting they were built to hold things much larger than a man.',
 11),

(47, 3, 'Profaned Capital',
 'The ruined capital of a civilisation consumed by a Profaned Flame that appeared without cause and has never been extinguished.',
 '/assets/images/placeholder.svg',
 'The Profaned Capital was a great city destroyed by a Profaned Flame — a fire that burns without purpose or meaning, unlike the First Flame that sustains the cycle. Yhorm the Giant, one of the Lords of Cinder, had sworn to protect the people of the capital even if they should turn against him. They did turn against him. The Profaned Flame consumed them all, and Yhorm remained as he promised — burned as a Lord of Cinder, keeping a vow to a city of corpses. The ruined capital is haunted by Gargoyles and Jailers.',
 12),

(48, 3, 'Anor Londo',
 'The seat of the gods — now cold and dark, its warmth replaced by Aldrich''s hunger and Sulyvahn''s ambition.',
 '/assets/images/placeholder.svg',
 'Anor Londo is the same city of gods familiar from Lordran, but centuries on. Pontiff Sulyvahn imprisoned Gwyndolin here — the last of Gwyn''s children — and fed him alive to Aldrich, who dreamed of ancient gods as he consumed them. The false sunlight is gone; the city stands in cold darkness. Silver Knights still patrol the cathedral, loyal to a gods long dead. In a side chamber hangs the painting of Ariandel, gateway to a world of ash and snow.',
 13),

(49, 3, 'Lothric Castle',
 'The pinnacle of the kingdom — towers, dragon-guarded rooftops, and a young prince who chose to let the fire die rather than perpetuate the cycle.',
 '/assets/images/placeholder.svg',
 'Lothric Castle is the seat of power of the kingdom of Lothric, home to Prince Lothric and his older brother Lorian. Lothric was prophesied to link the fire as generations of Lothric royalty had before. He refused — choosing to let the fire fade rather than continue a cycle he understood to be meaningless. Emma, the High Priestess, guards the path and sends the Unkindled to find the Lords of Cinder. The Consumed King''s Garden lies beneath the castle, and below that, the Untended Graves.',
 14),

(50, 3, 'Grand Archives',
 'A vast library of forbidden knowledge where scholars went mad reading truths that should not be written down.',
 '/assets/images/placeholder.svg',
 'The Grand Archives of Lothric hold the accumulated knowledge of generations of scholars dedicated to prolonging the First Flame through sorcery rather than sacrifice. Many dipped their heads in wax to shield their minds from the curse of forbidden knowledge — it was insufficient. Crystal Lizards nest in the towers alongside mad Scholars who attack on sight. The highest floor leads to the roof, where the Twin Princes wait to make their final stand — or to finally be allowed to rest.',
 15),

(51, 3, 'Untended Graves',
 'A dark echo of Firelink Shrine from a time when the fire has already gone out — cold, silent, and inhabited by a champion who was never given a purpose.',
 '/assets/images/placeholder.svg',
 'The Untended Graves exist in a temporal or dimensional echo of Firelink Shrine — a version of that place where the fire has been extinguished and no Fire Keeper remains to tend it. Champion Gundyr waits here: a version of the tutorial gatekeeper who was never released from his coiled sword in time, who sat in darkness for an age with no fire keeper to receive him and no quest to fulfil. The Shrine Handmaid here sells items belonging to fallen champions. The bonfire cannot be lit.',
 16),

(52, 3, 'Archdragon Peak',
 'A sacred mountaintop realm where the last followers of the ancient dragon path seek to become what they worship.',
 '/assets/images/placeholder.svg',
 'Archdragon Peak is a pilgrimage site for the Path of the Dragon covenant — those who seek to transcend mortality by emulating the ancient everlasting dragons. The Nameless King, a god of war who forsook his father Gwyn and his own name to ally himself with dragonkind, rules the apex from within the storm. Rock Drake companions serve as mounts and companions. Ancient Wyverns are venerated as living relics. To reach this place requires finding a gesture near a corpse in the Undead Settlement — a secret for the devoted.',
 17),

(53, 3, 'Kiln of the First Flame',
 'The end of everything. A vast field of ash and dying embers where the last guardian of the First Flame stands watch over an age refusing to end.',
 '/assets/images/placeholder.svg',
 'The Kiln of the First Flame is where the First Flame burns — the force that brought life, heat, and disparity to the world. The Soul of Cinder is not a single being but an amalgamation of every champion who has ever linked the fire, including Gwyn himself. It cycles through their fighting styles as if remembering each sacrifice. In its final phase it assumes the form and fighting style of Gwyn, Lord of Cinder — a tribute and an echo. The Unkindled must defeat it and then choose: link the fire and prolong the age, or walk away and usher in the age of dark.',
 18);

-- ── DS3 ZONE PREREQUISITES ───────────────────
INSERT INTO zone_prerequisites VALUES (37, 36); -- Firelink Shrine ← Cemetery of Ash
INSERT INTO zone_prerequisites VALUES (38, 37); -- High Wall ← Firelink Shrine
INSERT INTO zone_prerequisites VALUES (39, 38); -- Undead Settlement ← High Wall
INSERT INTO zone_prerequisites VALUES (40, 39); -- Road of Sacrifices ← Undead Settlement
INSERT INTO zone_prerequisites VALUES (41, 40); -- Cathedral of the Deep ← Road of Sacrifices
INSERT INTO zone_prerequisites VALUES (42, 40); -- Farron Keep ← Road of Sacrifices
INSERT INTO zone_prerequisites VALUES (43, 42); -- Catacombs of Carthus ← Farron Keep
INSERT INTO zone_prerequisites VALUES (44, 43); -- Smouldering Lake ← Catacombs
INSERT INTO zone_prerequisites VALUES (45, 43); -- Irithyll ← Catacombs
INSERT INTO zone_prerequisites VALUES (46, 45); -- Irithyll Dungeon ← Irithyll
INSERT INTO zone_prerequisites VALUES (47, 46); -- Profaned Capital ← Irithyll Dungeon
INSERT INTO zone_prerequisites VALUES (48, 45); -- Anor Londo ← Irithyll
INSERT INTO zone_prerequisites VALUES (49, 38); -- Lothric Castle ← High Wall (Dancer unlocks it)
INSERT INTO zone_prerequisites VALUES (50, 49); -- Grand Archives ← Lothric Castle
INSERT INTO zone_prerequisites VALUES (51, 49); -- Untended Graves ← Lothric Castle (via Consumed King's Garden)
INSERT INTO zone_prerequisites VALUES (52, 39); -- Archdragon Peak ← Undead Settlement (optional)
-- Kiln requires all four cinders of lords
INSERT INTO zone_prerequisites VALUES (53, 42); -- Kiln ← Farron Keep (Abyss Watchers)
INSERT INTO zone_prerequisites VALUES (53, 48); -- Kiln ← Anor Londo (Aldrich)
INSERT INTO zone_prerequisites VALUES (53, 47); -- Kiln ← Profaned Capital (Yhorm)
INSERT INTO zone_prerequisites VALUES (53, 50); -- Kiln ← Grand Archives (Lothric and Lorian)

-- ── DS3 BOSSES ───────────────────────────────
INSERT INTO bosses (id, zone_id, name, description, image_url, lore, hp, souls_reward, weakness, resistance, location, sort_order) VALUES

(40, 36, 'Iudex Gundyr',
 'The first trial — a great champion sealed inside a coiled sword, waiting to judge whether the Unkindled is worthy to begin the pilgrimage.',
 '/assets/images/placeholder.svg',
 'Iudex Gundyr was a champion who arrived to link the fire — but he came too late. No Fire Keeper waited for him, and he was sealed within a coiled sword as a gatekeeper for those who would come after. When the Pus of Man erupts from his body in the second phase, it is the Abyss creeping in during his centuries of waiting. He is not malevolent — he is a test, and he knows it.',
 3584, 3000, 'Lightning, Fire, Dark', 'Frost', 'Cemetery of Ash — the awakening ground', 1),

(41, 38, 'Vordt of the Boreal Valley',
 'A frost-coated beast of grey steel who was once an Outrider Knight of Irithyll, before Pontiff Sulyvahn''s ring consumed his reason.',
 '/assets/images/placeholder.svg',
 'Vordt was an Outrider Knight of Irithyll, one of the elite warriors of the Boreal Valley. Pontiff Sulyvahn granted him a ring — and the ring''s curse gradually consumed his reason, transforming him into a bestial, quadrupedal creature of pure frost and aggression. All Outrider Knights suffer this fate eventually. Vordt is not a monster by nature; he is a tragedy of compelled loyalty turned into something that can never return.',
 4948, 8000, 'Lightning, Fire', 'Frost, Dark', 'High Wall of Lothric — the great gate', 1),

(42, 39, 'Curse-Rotted Greatwood',
 'A colossal ancient tree fed on the curses of the undead, overgrown with white birch saplings. Break the cursed sacs and the tree reveals its true horror.',
 '/assets/images/placeholder.svg',
 'The Curse-Rotted Greatwood is an ancient tree that has absorbed the curses and accumulated souls of the countless undead buried beneath the settlement for generations. The white birch saplings growing from its bark are fed by these souls. The hollow villagers worship it as a god of festering and growth. Breaking the cursed tumours on its body drops it through the floor into a pit, revealing its nightmarish lower half — and the true scale of what has been growing beneath the village.',
 8228, 16000, 'Fire', 'Dark, Bleed', 'Undead Settlement — the Pit of Hollows', 1),

(43, 40, 'Crystal Sage',
 'A master of crystal sorcery who retreats through the Road of Sacrifices, taunting pursuers with illusory copies of itself.',
 '/assets/images/placeholder.svg',
 'The Crystal Sage is a sorcerer of exceptional ability who mastered the crystalline sorceries derived from Seath the Scaleless. It uses the Road of Sacrifices as its territory, teleporting ahead of pursuers and spawning illusory duplicates to confuse attackers. The crystal magic it wields is of a purer and more destructive quality than standard soul sorceries. It is one of two Crystal Sages encountered — the other resides in the Grand Archives.',
 3010, 18000, 'Dark, Fire', 'Magic', 'Road of Sacrifices — the flooded grove', 1),

(44, 41, 'Deacons of the Deep',
 'A swarm of hollowed cathedral deacons bearing the Archdeacon''s mantle. One among them carries the true flame — find it in the chaos.',
 '/assets/images/placeholder.svg',
 'The Deacons of the Deep were the clergy of the Cathedral who tended to Aldrich as he devoured. Over time they too were consumed — hollowed and scattered through the cathedral crypts. They retain a collective purpose: to protect the Deep. One Deacon at a time serves as the true body of the hive-mind, distinguished by a deep crimson glow. Killing the bearer passes the flame to another. Archdeacon McDonnell commands them from the rear.',
 3570, 34000, 'Fire', 'Magic, Dark', 'Cathedral of the Deep — the crypt altar', 1),

(45, 42, 'Abyss Watchers',
 'The Undead Legion of Farron — warriors bound by wolf blood who hunt the Abyss, now fighting each other as the Abyss hunts them from within.',
 '/assets/images/placeholder.svg',
 'The Abyss Watchers swore an oath to hunt all manner of Abyss-born creatures, drinking wolf blood to empower their mission in honour of Artorias the Abysswalker. The blood turned against them — it now drives them to fight each other endlessly. In the second phase they rise as a single entity wreathed in the dark fire of the Abyss itself. Their fighting style is a faithful echo of Artorias, fast and aggressive, circling and rolling into strikes.',
 5317, 36000, 'Lightning', 'Dark', 'Farron Keep — the sealed arena', 1),

(46, 43, 'High Lord Wolnir',
 'A fallen conqueror of incomprehensible size who reached into the Abyss to defeat death itself — and found the Abyss reaching back.',
 '/assets/images/placeholder.svg',
 'High Lord Wolnir was the supreme ruler of Carthus who conquered kingdom after kingdom until he turned his ambition toward conquering death itself. He performed rituals that drew the Abyss into his bones. The three golden bracelets on his wrists are the only barriers holding the Abyss at bay — their destruction is what finally ends him. He is enormous, barely fitting in the arena, and emerges from a chalice of dark. He is not truly alive; he is a thing the Abyss is wearing.',
 13000, 38000, 'Lightning, Fire', 'Dark', 'Catacombs of Carthus — the Bone Bridge', 1),

(47, 44, 'Old Demon King',
 'The last sovereign of a dying demon civilisation, keeping the fading Chaos Flame alive through sheer presence and grief.',
 '/assets/images/placeholder.svg',
 'The Old Demon King is the last surviving ruler of the demon people — descendants of the Chaos Flame that erupted in Izalith long ago. The Chaos Flame is nearly spent; with it, the source of all demonic life will end. The Old Demon King absorbs what remains of the flame into himself, his body a living furnace for a dying fire. He is not aggressive by nature — he is protecting the last warmth of a world ending. His curved sword drips with the lava that was once a civilisation.',
 8507, 50000, 'Lightning, Frostbite', 'Fire', 'Smouldering Lake — the demon''s throne', 1),

(48, 45, 'Pontiff Sulyvahn',
 'The ruler of Irithyll — a sorcerer of terrible ambition who wields a profane sword in one hand and a sword of the moon in the other.',
 '/assets/images/placeholder.svg',
 'Pontiff Sulyvahn came from the Painted World of Ariandel, a child prodigy who discovered the Profaned Flame and the visions within Aldrich''s dreams. He seized power in Irithyll by imprisoning Gwyndolin and feeding him alive to Aldrich. He wields two greatswords simultaneously — one of dark fire, one of dark ice — and can summon a ghostly duplicate of himself. He is the architect of the game''s central crisis: the abandonment of the thrones, the silencing of the gods, the chain of catastrophes.',
 12416, 86000, 'Lightning', 'Dark, Fire', 'Irithyll of the Boreal Valley — the cathedral gate', 1),

(49, 48, 'Aldrich, Devourer of Gods',
 'A saint who discovered that devouring the souls of men granted great power — and never stopped. Now he slithers on a heap of bones and souls.',
 '/assets/images/placeholder.svg',
 'Aldrich was a cleric who began consuming men whole, accumulating immense power in soul and body until he became a vast, sludge-like entity. The Church of the Deep formed around his consumption, venerating him as a god of the deep sea. Made a Lord of Cinder against his will, he burned at the First Flame and dreamed of ancient gods. Upon awakening he consumed Gwyndolin and fashioned an illusory bow from his likeness, firing arrows from Gwyndolin''s own weapons. In his death throes he still dreams — of Crossbreed Priscilla, reaching out.',
 13448, 120000, 'Lightning, Fire', 'Dark, Magic', 'Anor Londo — the cathedral throne', 1),

(50, 47, 'Yhorm the Giant',
 'A Lord of Cinder who made a covenant with a city that hated him, and kept it — burning alone in their ruined capital for eternity.',
 '/assets/images/placeholder.svg',
 'Yhorm made a promise to protect the people of the Profaned Capital even if they should turn against him. They did. The Profaned Flame consumed the city without warning and Yhorm remained as he had sworn, burning as a Lord of Cinder to power a cycle he had no reason to sustain. He gave his most trusted ally Siegward of Catarina a Storm Ruler sword — the only weapon truly effective against him — as a contingency. Siegward has spent the entire game trying to find a way to fulfil his promise to Yhorm.',
 18830, 120000, 'Lightning, Storm Ruler', 'Fire', 'Profaned Capital — the great hall', 1),

(51, 49, 'Dancer of the Boreal Valley',
 'An Outrider Knight of terrible grace — slow and deliberate, twin scimitars of fire and dark, the final seal on Lothric Castle.',
 '/assets/images/placeholder.svg',
 'The Dancer was one of Sulyvahn''s most formidable Outrider Knights, assigned to serve Emma the High Priestess of Lothric as an executioner and guardian. When Emma''s final duty is complete she uses her dying breath to summon the Dancer — the true gate between the lower kingdom and Lothric Castle above. The Dancer fights with devastating, deliberate grace. In her second phase she draws a second scimitar of dark flame, fighting with both simultaneously in sweeping, balletic patterns.',
 15292, 50000, 'Dark', 'Fire', 'High Wall of Lothric — the shrine gate', 1),

(52, 49, 'Dragonslayer Armour',
 'A suit of armour animated by the will of dead Pilgrim Butterflies. No soul within — only duty, weight, and a greataxe.',
 '/assets/images/placeholder.svg',
 'The Dragonslayer Armour was worn by a legendary warrior of Lothric who slew ancient dragons. The warrior has long since departed — the armour is now animated by Pilgrim Butterflies who cling to it from above and move it like a marionette. It wields the same equipment its original wearer used — a tremendous greataxe, a massive greatshield, lightning projectiles — but there is nothing inside that suffers or thinks. It is duty made manifest, continuing for no reason except that it has not been told to stop.',
 12006, 120000, 'Lightning', 'Dark, Fire', 'Lothric Castle — the rooftop bridge', 2),

(53, 49, 'Oceiros, the Consumed King',
 'The former king of Lothric, transformed by his obsession with dragon sorcery, cradling an invisible child he cannot let go.',
 '/assets/images/placeholder.svg',
 'Oceiros was King of Lothric, father of Lorian and Lothric. In his later years he became obsessed with the sorceries of Seath the Scaleless and the ancient dragon bloodline, eventually transforming himself into a pale, dragon-like creature. He speaks endlessly to an invisible child — Ocelotte, his youngest son, whom he called destined for greatness. Whether Ocelotte died, never existed, or simply cannot be seen is never answered. Oceiros is one of the more overtly tragic figures of the game — a king who destroyed himself reaching for something he never found.',
 9779, 50000, 'Fire', 'Magic, Lightning', 'Lothric Castle — the Consumed King''s Garden', 3),

(54, 51, 'Champion Gundyr',
 'The unshackled form of Iudex Gundyr — no coiled sword, no mercy, the full fury of a champion who never got to serve.',
 '/assets/images/placeholder.svg',
 'Champion Gundyr is the same being as the tutorial boss — but here in the Untended Graves, where no Fire Keeper ever came and the shrine sits in darkness, he was never given a purpose. He wears no coiled sword and fights without restraint, a fully awakened champion with nowhere to direct his power. He is not a villain. He is a warrior of immense ability who sat alone in the dark for centuries, waiting for a duty that never arrived.',
 8980, 50000, 'Frostbite', 'Fire', 'Untended Graves — the dark shrine', 1),

(55, 52, 'Ancient Wyvern',
 'A massive wyvern enthroned atop Archdragon Peak — venerated by the dragon followers as living divinity. A plunging attack is the key.',
 '/assets/images/placeholder.svg',
 'The Ancient Wyvern is one of the great rock drakes of Archdragon Peak, venerated by the Path of the Dragon covenant as a living embodiment of the ancient dragons. Unlike true everlasting dragons it is mortal, though enormous and powerful. The fight is structured around the environment — engaging it directly risks fire death, but a careful ascent to the walkway above allows a plunging attack that ends the fight in a single strike. The Nameless King observes from the summit.',
 4800, 40000, 'Lightning', 'Fire', 'Archdragon Peak — the entrance plateau', 1),

(56, 52, 'The Nameless King',
 'A god of war who forsook father, duty, and name to ally with the ancient dragons. He rides a King of the Storm — and when it falls, he fights alone.',
 '/assets/images/placeholder.svg',
 'The Nameless King was a son of Gwyn, Lord of Sunlight — likely the Firstborn, whose name was struck from the annals of history when he allied himself with the ancient dragons, enemies of the gods. He chose the dragons over his birthright. His companion in the first phase is the King of the Storm, a massive wyvern who must be slain before the true fight begins. Freed from his mount the Nameless King fights with the Swordspear of the Storm and lightning power his father would have recognised. He is the first dragonslayer who chose the side of the dragon.',
 11964, 60000, 'Dark, Frostbite', 'Lightning', 'Archdragon Peak — the storm summit', 2),

(57, 50, 'Princes Lothric and Lorian',
 'Two brothers — one who cannot walk, one who would not let his brother face destiny alone. The most human ending in the trilogy.',
 '/assets/images/placeholder.svg',
 'Lorian, Elder Prince, is an enormous man crippled by a divine curse he took on voluntarily to spare his younger brother from its effects. Lothric, Younger Prince, was prophesied to link the fire and refused — not from cowardice but from understanding. He chose to let the fire die. When Lorian falls, Lothric resurrects him rather than face the end alone. They fight together or not at all. They are not villains; they are two brothers who chose each other over the demands of a cycle that was never truly theirs.',
 11980, 120000, 'Dark', 'Fire', 'Grand Archives — the Prince''s Chamber', 1),

(58, 53, 'Soul of Cinder',
 'The last guardian of the First Flame — not one being but the memory of every champion who ever burned here, fighting together one final time.',
 '/assets/images/placeholder.svg',
 'The Soul of Cinder is a composite entity formed from the accumulated essence of every Unkindled and champion who ever linked the First Flame. It cycles through multiple fighting styles — straight sword and shield, pyromancy stances, curved sword aggression, spear and caution, sorcery — as if remembering each of them in turn. In its final phase it assumes the posture of Gwyn, Lord of Cinder himself, fighting with the same furious speed and the same lightning-infused slashes. To defeat the Soul of Cinder is to end every sacrifice that came before, and then to choose: feed the flame, or let it die.',
 14762, 500000, 'Dark', 'Fire', 'Kiln of the First Flame — the altar of embers', 1);

-- Activate DS3
UPDATE games SET is_active = 1,
  description = 'The Age of Fire fades and the Lords of Cinder abandon their thrones. Journey through the kingdom of Lothric and face the remnants of an age ending — or choose to let the fire go out at last.'
WHERE slug = 'ds3';
