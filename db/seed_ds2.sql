-- =============================================
-- DARK SOULS PATHFINDER — DS2 Seed Data
-- Scholar of the First Sin
-- Run AFTER schema.sql and seed.sql
-- Uses defaultdb — no CREATE DATABASE / USE
-- DS2 zone IDs: 18–35  |  boss IDs: 18–39
-- =============================================

-- Activate DS2
UPDATE games SET is_active = 1,
  description = 'A new curse grips the land of Drangleic. Seek the four Great Souls and unravel the cycle of light and dark that has repeated since time immemorial.'
WHERE slug = 'ds2';

-- ── DS2 ZONES ────────────────────────────────
INSERT INTO zones (id, game_id, name, description, image_url, lore, sort_order) VALUES

(18, 2, 'Things Betwixt',
 'The threshold between worlds. A misty hamlet tended by aged women who speak in riddles and prepare you for the journey ahead.',
 '/assets/images/placeholder.svg',
 'Things Betwixt exists at the boundary of Drangleic and the unknown — a liminal place inhabited by the Emerald Herald and the three Firekeepers known as the Majula witches. Undead drawn to Drangleic by the curse arrive here first, stripped of memory and purpose. The realm is said to sit outside of time itself, which is why it never changes.',
 1),

(19, 2, 'Majula',
 'A sun-drenched clifftop hamlet overlooking a deep pit and a calm sea. The closest thing to a sanctuary Drangleic offers.',
 '/assets/images/placeholder.svg',
 'Majula is a small settlement perched on coastal cliffs that serves as the central hub of Drangleic. The pit at its centre descends into ancient catacombs. Merchants, trainers, and wanderers gather here — all drawn to the bonfire of peculiar warmth. The Emerald Herald waits here to kindle your Estus Flask. Despite its apparent peace, the town is built atop ruin.',
 2),

(20, 2, 'Forest of Fallen Giants',
 'The ruins of an ancient kingdom swallowed by a great forest. Soldiers still guard the walls, though they no longer know why.',
 '/assets/images/placeholder.svg',
 'The Forest of Fallen Giants was once a thriving fortress-city. A great battle was fought here against the Giants who crossed the sea — and though the Giants were repelled, the kingdom never fully recovered. The forest has slowly reclaimed the stonework. The Last Giant, survivor of that ancient war, is shackled in the deepest ruins, still fighting a war that ended long ago.',
 3),

(21, 2, 'Heide''s Tower of Flame',
 'Crumbling spires rising from a shallow sea. Dragon Knights stand motionless at their posts, waiting for centuries.',
 '/assets/images/placeholder.svg',
 'Heide''s Tower of Flame is all that remains of an ancient civilisation that predates even Drangleic. The Dragon Knights who guard it have stood vigil so long they have become part of the architecture — dormant until disturbed. The Old Dragonslayer haunts the highest tier. It is said Heide was the precursor kingdom to Drangleic, sharing its fate as yet another link in an endless cycle.',
 4),

(22, 2, 'No-Man''s Wharf',
 'A fog-choked port town cut into a coastal cliff. Poison-spitting hollows and a howling undead lurk in the dark.',
 '/assets/images/placeholder.svg',
 'No-Man''s Wharf is a forsaken dockyard carved into sea cliffs, once used to ferry prisoners to the Lost Bastille. The residents have long since gone hollow, armed with blowpipes and torches. A monstrous creature known as the Flexile Sentry guards the ship that is the only way forward. Ringing the bell summons the vessel from the fog.',
 5),

(23, 2, 'The Lost Bastille',
 'A crumbling sea-fortress used as a prison for the undead. Its cells are still occupied — by things that should not be.',
 '/assets/images/placeholder.svg',
 'The Lost Bastille was a prison built specifically to contain the undead — those afflicted with the Darksign who could not be killed. Generations of Drangleic''s worst were sealed within its walls. Now the jailers have gone hollow alongside the prisoners. The Ruin Sentinels — three armoured warriors sharing a collective soul — guard the inner halls. The Belfry above is contested by Bell Keepers.',
 6),

(24, 2, 'Sinner''s Rise',
 'A flooded tower built to hold one prisoner — the Lost Sinner, whose crime against the First Flame doomed her to an eternal cell.',
 '/assets/images/placeholder.svg',
 'Sinner''s Rise descends beneath the Lost Bastille into flooded chambers lit by hanging lanterns. The Lost Sinner chose to rekindle the First Flame through forbidden means and was imprisoned for it. She is not malevolent — she is driven mad by guilt, swinging her blade in endless penance. Her soul holds one of the four Great Souls needed to open Drangleic Castle.',
 7),

(25, 2, 'Huntsman''s Copse',
 'A ravine thick with bandits, bone piles, and the smell of death. A stone bridge leads toward the mountains.',
 '/assets/images/placeholder.svg',
 'Huntsman''s Copse is a dark valley used as a hunting ground and execution site. Hanging cages dangle from bridges above. Undead bandits and necromancers have carved out territory here. The Skeleton Lords — three ancient commanders of the dead — claim the furthest chamber, their power fragmenting into swarms upon death.',
 8),

(26, 2, 'Harvest Valley',
 'Toxic windmills churn poison gas through a valley of abandoned mining scaffolds. Everything here is dying slowly.',
 '/assets/images/placeholder.svg',
 'Harvest Valley was once a prosperous mine. Now the windmills that once drove the mining machinery pump poisonous gas through the passages instead. The valley connects the Copse to Earthen Peak above. Petrified hollow miners still move through the fog, their lungs long since rotted away. The Covetous Demon — bloated with the souls it has consumed — nests in the caves below.',
 9),

(27, 2, 'Earthen Peak',
 'A desert tower rising from the poison mist below. Queen Mytha rules here — or what is left of her after she drank the poison herself.',
 '/assets/images/placeholder.svg',
 'Earthen Peak is a windmill fortress perched above Harvest Valley. Mytha, the Baneful Queen, was once beautiful and beloved — but her obsession with keeping her king''s affection led her to drink the very poison of the valley to make herself more exotic. The poison drove her to madness. She now rules the peak as a lamia, half-woman, half-snake, the poison of the valley flowing through her veins.',
 10),

(28, 2, 'Iron Keep',
 'A fortress sinking into a lake of lava. The Old Iron King built it too heavy and too proud, and it sank under its own weight.',
 '/assets/images/placeholder.svg',
 'The Iron Keep was the seat of the Old Iron King — a ruler so wealthy and so arrogant he built his fortress above a volcanic lake. The weight of his ambition literally sank the keep into the lava. The Smelter Demon — an ancient golem ignited by the old king''s soul — patrols the molten halls. The Old Iron King himself dwells deep within, a massive armoured colossus looming over a lava pit.',
 11),

(29, 2, 'Shaded Woods',
 'An enchanted forest where the fog blinds you completely. Ancient lion warriors stalk the mist.',
 '/assets/images/placeholder.svg',
 'The Shaded Woods are veiled in an impenetrable magical fog conjured to protect the path to the Shrine of Winter and Drangleic Castle. Raime''s Alonne Knights, now the maned Shaded Ruins warriors, prowl the misty paths. Scorpioness Najka — a scholar transformed into a scorpion centaur by her own experiments — defends the deeper woods. The fog lifts only in the section surrounding the ancient ruins.',
 12),

(30, 2, 'Drangleic Castle',
 'The seat of King Vendrick, built as a monument to power and as a last defence against the Giants. Now a trap-laden ruin.',
 '/assets/images/placeholder.svg',
 'Drangleic Castle was built by King Vendrick using the souls of the Giants he defeated. Its doors will only open for one who carries the four Great Souls. Within, Vendrick''s soul lingers, and the truth of Drangleic''s founding is slowly revealed. Nashandra, Vendrick''s queen, manipulated him into starting the war with the Giants to obtain their power — and ultimately consumed him from within.',
 13),

(31, 2, 'Shrine of Amana',
 'A luminous lake filled with singing undead women whose song pulls you toward them and into the water.',
 '/assets/images/placeholder.svg',
 'The Shrine of Amana is a hauntingly beautiful wetland filled with bioluminescent plants and the ruins of ancient spires. The Milfanito — women tasked with singing to keep the Demon of Song sealed beneath — wade through the shallows. Their song acts as a compulsion for undead, drawing them closer. The Demon of Song, a monstrous frog-like creature that mimics human faces, lurks in the depths.',
 14),

(32, 2, 'Undead Crypt',
 'The burial ground of Drangleic''s royalty and its greatest warriors. Velstadt, the Royal Aegis, guards the tomb of King Vendrick.',
 '/assets/images/placeholder.svg',
 'The Undead Crypt was built to inter Drangleic''s honoured dead and to ensure the hollowed king Vendrick would not be disturbed. Velstadt, Vendrick''s most loyal knight, gave up his own life and sanity to guard his king''s hollow form — absorbing the darkness of the Abyss into his armour in doing so. Vendrick himself wanders the deepest chamber, hollow and purposeless, reduced to echoing his former greatness.',
 15),

(33, 2, 'Black Gulch',
 'A deep chasm of tar and venom where strange creatures cling to the walls and the Rotten waits below.',
 '/assets/images/placeholder.svg',
 'Black Gulch is a tar-filled ravine beneath the Shaded Woods, reachable by dropping into the pit in Majula. The walls are covered in strange statues that vomit poison. The Rotten — a mass of corpses fused together to store a Great Soul it was not meant to possess — dwells at the bottom. It is one of the four creatures formed when a Lord Soul shattered and its fragments were claimed by mortal flesh.',
 16),

(34, 2, 'Brightstone Cove Tseldora',
 'A spider-infested mine where a duke''s obsession with brightstone ended in catastrophe.',
 '/assets/images/placeholder.svg',
 'Brightstone Cove Tseldora was a coastal mining settlement rich in brightstone — a luminous mineral of great magical value. Duke Tseldora''s obsession with the brightstone and the spiders that fed on it led him to invite the creatures in rather than drive them out. Duke''s Dear Freja, a colossal two-headed spider that consumed the Duke''s soul, now nests in the mine''s heart, surrounded by countless offspring.',
 17),

(35, 2, 'Throne of Want',
 'The final chamber beneath Drangleic Castle. The throne that promises an end to the undead curse — but its meaning is not what it seems.',
 '/assets/images/placeholder.svg',
 'The Throne of Want is the culmination of Drangleic''s cycle. Nashandra — a fragment of Manus, Father of the Abyss — manipulated the entire kingdom to reach this throne and claim its power for herself. The Throne Watcher and Throne Defender guard the approach. Nashandra awaits beyond them, offering not salvation but annihilation. Sitting the throne means linking the fire — or choosing to let the flame die.',
 18);

-- ── DS2 ZONE PREREQUISITES ───────────────────
-- Things Betwixt is the start — no prerequisites
INSERT INTO zone_prerequisites VALUES (19, 18); -- Majula ← Things Betwixt
INSERT INTO zone_prerequisites VALUES (20, 19); -- Forest ← Majula
INSERT INTO zone_prerequisites VALUES (21, 20); -- Heide's ← Forest
INSERT INTO zone_prerequisites VALUES (22, 21); -- Wharf ← Heide's
INSERT INTO zone_prerequisites VALUES (23, 22); -- Lost Bastille ← Wharf
INSERT INTO zone_prerequisites VALUES (24, 23); -- Sinner's Rise ← Lost Bastille
INSERT INTO zone_prerequisites VALUES (25, 19); -- Huntsman's Copse ← Majula
INSERT INTO zone_prerequisites VALUES (26, 25); -- Harvest Valley ← Copse
INSERT INTO zone_prerequisites VALUES (27, 26); -- Earthen Peak ← Harvest Valley
INSERT INTO zone_prerequisites VALUES (28, 27); -- Iron Keep ← Earthen Peak
INSERT INTO zone_prerequisites VALUES (29, 20); -- Shaded Woods ← Forest
INSERT INTO zone_prerequisites VALUES (33, 20); -- Black Gulch ← Forest
INSERT INTO zone_prerequisites VALUES (34, 29); -- Brightstone Cove ← Shaded Woods
-- Drangleic Castle requires all 4 Great Soul areas
INSERT INTO zone_prerequisites VALUES (30, 24); -- Drangleic Castle ← Sinner's Rise
INSERT INTO zone_prerequisites VALUES (30, 28); -- Drangleic Castle ← Iron Keep
INSERT INTO zone_prerequisites VALUES (30, 33); -- Drangleic Castle ← Black Gulch
INSERT INTO zone_prerequisites VALUES (30, 34); -- Drangleic Castle ← Brightstone Cove
INSERT INTO zone_prerequisites VALUES (31, 30); -- Shrine of Amana ← Drangleic Castle
INSERT INTO zone_prerequisites VALUES (32, 31); -- Undead Crypt ← Shrine of Amana
INSERT INTO zone_prerequisites VALUES (35, 32); -- Throne of Want ← Undead Crypt

-- ── DS2 BOSSES ───────────────────────────────
INSERT INTO bosses (id, zone_id, name, description, image_url, lore, hp, souls_reward, weakness, resistance, location, sort_order) VALUES

(18, 20, 'The Last Giant',
 'A colossal ancient Giant shackled to the deepest wall of the ruins. It tears off its own arm to fight you.',
 '/assets/images/placeholder.svg',
 'The Last Giant is the sole surviving prisoner of the war between Drangleic and the Giants from across the sea. It has been shackled in the deepest dungeon of the Forest of Fallen Giants for so long that the chains have become part of it. It recognises the bearer of the curse and tears itself free with primal fury — ripping off its own arm to use as a weapon.',
 5120, 12000, 'Fire, Strike', 'Slash', 'Forest of Fallen Giants — prisoner''s chamber', 1),

(19, 20, 'The Pursuer',
 'An enormous knight that hunts the bearer of the curse specifically. It will find you more than once.',
 '/assets/images/placeholder.svg',
 'The Pursuer is not a random guardian — it is a hunter sent specifically to track and eliminate the bearer of the curse. It appears first in the Forest of Fallen Giants and will ambush the player throughout the game in various locations. Its origin and master are never revealed. It wields a cursed blade that reduces maximum HP on hit and uses a shield that deflects spells.',
 9575, 22000, 'Lightning', 'Dark, Poison', 'Forest of Fallen Giants — top of the watchtower', 2),

(20, 21, 'Dragonrider',
 'A mounted knight of an ancient king, now separated from his steed and diminished — but still formidable on a narrow platform.',
 '/assets/images/placeholder.svg',
 'The Dragonriders were the royal guard of King Vendrick''s predecessor, elite knights who rode enormous wyverns into battle. This one stands alone on a crumbling platform above the sea, the last echo of a dynasty long since faded. In later encounters, two Dragonriders are fought simultaneously, a grim reminder of what they once were as a unit.',
 5600, 18000, 'Lightning, Fire', 'Poison, Bleed', 'Heide''s Tower of Flame — upper platform', 1),

(21, 21, 'Old Dragonslayer',
 'A phantom in ancient armour wielding lightning-infused spear and shield. A dark echo of a legendary warrior.',
 '/assets/images/placeholder.svg',
 'The Old Dragonslayer bears an uncanny resemblance to Ornstein of Anor Londo — same armour, same spear technique. Whether he IS Ornstein, his descendant, or merely an echo of that legend given form by the undead curse, is left ambiguous. He wields dark lightning rather than golden lightning, suggesting corruption or age has changed whatever he once was.',
 11945, 32000, 'Lightning', 'Dark', 'Heide''s Tower of Flame — cathedral pinnacle', 2),

(22, 22, 'Flexile Sentry',
 'A horrific fusion of two bodies stitched together at the waist — one armed, one unarmed — guarding the ship in the fog.',
 '/assets/images/placeholder.svg',
 'The Flexile Sentry is the product of a cruel experiment: two prisoners fused together as punishment, creating a creature that can never rest because while one body sleeps the other is awake. It guards the ship in No-Man''s Wharf that leads to the Lost Bastille. The fight takes place on a sinking ship during a storm, with the arena flooding as the battle progresses.',
 9940, 26000, 'Lightning, Fire', 'Poison', 'No-Man''s Wharf — the phantom ship', 1),

(23, 23, 'Ruin Sentinels',
 'Three giant armoured sentinels sharing one fragmented soul. The fight begins on a ledge — fall down and face all three.',
 '/assets/images/placeholder.svg',
 'The Ruin Sentinels are ancient guardians of the Lost Bastille, their identities and creators long forgotten. They share a single fractured soul distributed among three bodies, making them both individual and collective. The first descends from the ceiling alone; fall to the floor and the other two join the fight immediately. Their giant shields and polearms make them relentless.',
 5770, 48000, 'Lightning, Strike', 'Poison, Bleed', 'Lost Bastille — Cardinal Tower, great hall', 1),

(24, 23, 'Belfry Gargoyles',
 'Four stone gargoyles defending the bell tower above the Bastille. Ring the bell at the cost of fighting them all at once.',
 '/assets/images/placeholder.svg',
 'The Belfry Gargoyles are the guardians of the Bell Tower contested by the Bell Keepers covenant. Unlike the single pair in Lordran, up to four gargoyles can be active simultaneously, creating a chaotic multi-target brawl. The Bell Keepers will also invade during this fight, adding human opponents to the chaos. Ringing the bell serves no plot purpose — it is purely an act of will.',
 6720, 29000, 'Lightning, Fire', 'Bleed', 'Lost Bastille — Belfry Luna bell tower', 2),

(25, 24, 'Lost Sinner',
 'A ragged hollow chained and mad, swinging a greatsword in frantic penance for a sin she chose freely.',
 '/assets/images/placeholder.svg',
 'The Lost Sinner attempted to rekindle the First Flame through forbidden ritual, seeking to end the undead curse. For this she was imprisoned in Sinner''s Rise, sealed in a flooded cell. She is not an enemy by nature — she is driven to madness by guilt and the sound of her own chains. Her Great Soul is one of four needed to open Drangleic Castle. In NG+, she is flanked by two Sorcerers who illuminate the arena.',
 18540, 68000, 'Fire, Lightning', 'Dark', 'Sinner''s Rise — flooded lower cell', 1),

(26, 25, 'Skeleton Lords',
 'Three ancient necromancer lords sitting on thrones who, upon death, each summon a swarm of lesser skeletons.',
 '/assets/images/placeholder.svg',
 'The Skeleton Lords were powerful necromancers who each claimed a fragment of power over death. They sit inert on thrones until the player approaches, at which point all three rise simultaneously. Their individual deaths are straightforward; the danger is that each one spawns a different type of skeleton swarm — the swarms must be defeated before they overwhelm the arena. Kill the lords first, manage the swarms.',
 6100, 34000, 'Fire, Strike', 'Dark, Bleed', 'Huntsman''s Copse — cave of the lords', 1),

(27, 26, 'Covetous Demon',
 'A bloated, sluglike abomination that swallowed too many human souls and became something terrible.',
 '/assets/images/placeholder.svg',
 'The Covetous Demon was once a man so consumed by lust for a woman''s affection that he devoured other humans in his obsession. The souls of those he consumed transformed him into a massive slug-like demon. He wallows in a pit filled with caged hollows in Harvest Valley, still ''consuming'' in the only way he knows. He will eat the hollow prisoners to restore his health if they are not destroyed.',
 11500, 38000, 'Fire, Lightning', 'Dark, Poison', 'Harvest Valley — Covetous''s pit', 1),

(28, 27, 'Mytha, the Baneful Queen',
 'The Queen of Earthen Peak, transformed into a serpent from the waist down by the poison she drank willingly.',
 '/assets/images/placeholder.svg',
 'Mytha was the queen of a desert kingdom, beautiful and beloved. Fearful that her king''s eye would wander, she sought to make herself more alluring by bathing in the poisons of Harvest Valley and eventually drinking them. The poison did not kill her — it transformed her, body and mind. Now she rules the peak as a lamia, half-woman and half-serpent, coated in the very toxins that consumed her.',
 14400, 52000, 'Fire, Strike', 'Poison, Dark', 'Earthen Peak — Queen''s chamber', 1),

(29, 28, 'Smelter Demon',
 'An iron golem reignited by the Old Iron King''s power. It stabs its own chest to engulf itself in flames mid-fight.',
 '/assets/images/placeholder.svg',
 'The Smelter Demon was an iron construct animated by the soul of the Old Iron King — a war machine of terrible power. Left alone when the keep sank into the lava, it has maintained its vigil for ages. Mid-fight it impales its own chest with its sword, igniting itself and adding a fire aura to all its attacks. The Blue Smelter Demon variant found in the Iron Passage has lightning properties instead.',
 14060, 52000, 'Lightning', 'Fire', 'Iron Keep — the foundry', 1),

(30, 28, 'Old Iron King',
 'The former ruler of Iron Keep — now a colossal iron giant looming from a lava pit, surrounded by the ruin of his pride.',
 '/assets/images/placeholder.svg',
 'The Old Iron King was a ruler of boundless ambition and pride. He constructed the Iron Keep above a volcanic lake as a monument to his supremacy — and it sank. His physical form was consumed by the lava and reforged into something half-man, half-furnace. His Great Soul, one of the four needed to open Drangleic Castle, is a relic of the mighty king he once was.',
 21000, 78000, 'Lightning', 'Fire', 'Iron Keep — lava chamber', 2),

(31, 29, 'Scorpioness Najka',
 'A scholar and sorceress transformed into a scorpion centaur, her stingers laced with both poison and magic.',
 '/assets/images/placeholder.svg',
 'Najka was a scholar who studied transformation magic in the Shaded Woods alongside her beloved Manscorpion Tark. Her experiments went too far — she was transformed into a scorpion centaur, her mind fractured by the pain of the change. Unlike Tark, who retained his reason, Najka attacks on sight. She wields two stinger tails and can cast powerful sorceries from her human half.',
 13640, 48000, 'Lightning, Fire', 'Poison, Dark', 'Shaded Woods — the fogbound ruins', 1),

(32, 34, 'Prowling Magus & Congregation',
 'A pale sorcerer flanked by a shambling congregation of hollow worshippers in a ruined church.',
 '/assets/images/placeholder.svg',
 'The Prowling Magus was a scholar of Brightstone Cove who led his congregation in ritual worship of the spiders. When Duke Tseldora embraced the spiders fully, the Magus and his flock followed — hollowing out in service to something they no longer understood. They swarm the church in great numbers; the Magus himself is fragile but commands powerful miracle-like hexes from the rear.',
 4000, 29000, 'Fire, Lightning', 'Dark', 'Brightstone Cove Tseldora — ruined church', 1),

(33, 34, 'Duke''s Dear Freja',
 'A colossal two-headed spider that consumed the Duke of Tseldora — one head of purest hunger, the other of arcane power.',
 '/assets/images/placeholder.svg',
 'Duke''s Dear Freja is the progenitor spider of Brightstone Cove, vast in size and ancient in age. Duke Tseldora, obsessed with brightstone and the spiders that fed on it, eventually offered himself to Freja and was consumed. She now carries his soul within her, making her one of the four Great Soul bearers. The fight takes place in total darkness until a torch or light source is used.',
 14790, 72000, 'Fire, Lightning', 'Poison, Dark', 'Brightstone Cove Tseldora — nest chamber', 2),

(34, 33, 'The Rotten',
 'A writhing mass of corpses fused around a Great Soul it has no right to possess — desperate to keep what it has.',
 '/assets/images/placeholder.svg',
 'The Rotten is one of four beings created when the Old Dead One''s soul shattered and its pieces were claimed by unworthy vessels. It is an amalgamation of countless corpses pressed together, animated by the desire to possess a Great Soul and to remain whole. It wields a massive cleaver and collapses forward repeatedly. Its form is not stable — it is barely holding itself together, which makes it desperate and relentless.',
 19900, 68000, 'Fire, Lightning', 'Dark', 'Black Gulch — pit at the bottom', 1),

(35, 31, 'Demon of Song',
 'A monstrous frog-creature with a human face it uses as a lure. The Milfanito sang to keep it sealed.',
 '/assets/images/placeholder.svg',
 'The Demon of Song dwells beneath the Shrine of Amana, sealed there by the song of the Milfanito women who wade the shallows above. It mimics a human face on the inside of its mouth to lure the undead drawn by the song. The Milfanito cannot be freed as long as it lives. Its true form is an enormous frog-like creature of immense power — the face is merely a mask.',
 22600, 78000, 'Lightning, Strike', 'Fire, Dark', 'Shrine of Amana — sunken cathedral', 1),

(36, 32, 'Velstadt, the Royal Aegis',
 'The most loyal knight in Drangleic, standing eternal guard over a hollow king he could not save.',
 '/assets/images/placeholder.svg',
 'Velstadt was Vendrick''s most trusted knight — his shield and shadow. When Vendrick hollow, Velstadt chose to remain and protect him rather than seek a cure or flee. He absorbed the darkness of the Abyss into his armour to empower himself for this eternal vigil. His bell mace channels dark miracles. He is not hollow — he is fully present, fully devoted, enduring an eternity of purposeless duty.',
 22740, 96000, 'Lightning', 'Dark, Fire', 'Undead Crypt — royal antechamber', 1),

(37, 32, 'Vendrick',
 'The hollow king of Drangleic, wandering in circles in his own tomb — stripped of his soul and his mind.',
 '/assets/images/placeholder.svg',
 'Vendrick was a great king who built Drangleic, defeated the Giants, and sought to end the undead curse. His queen Nashandra — a fragment of Manus, Father of the Abyss — manipulated him at every step. When he realised the truth, he sealed himself away with his own soul separated from his body, ensuring Nashandra could never claim it. Now he wanders hollow, enormous and unarmed, unless provoked. Without Giant Souls he has near-infinite defence.',
 50000, 240000, 'Lightning', 'Dark, Fire', 'Undead Crypt — the king''s chamber', 2),

(38, 35, 'Throne Watcher & Throne Defender',
 'Two knights of perfect complement — one attuned to light, one to dark — guarding the Throne of Want together.',
 '/assets/images/placeholder.svg',
 'The Throne Watcher and Throne Defender are the ultimate guardians of Drangleic''s throne — created not to serve the king but to ensure the throne''s power is not misused. They are conceptual opposites made flesh: the Watcher embodies vigilance and light, the Defender embodies sacrifice and endurance. Defeating one causes the other to revive it; both must be brought low simultaneously.',
 18700, 84000, 'Fire (Watcher), Lightning (Defender)', 'Dark', 'Throne of Want — antechamber', 1),

(39, 35, 'Nashandra',
 'The queen of Drangleic — beautiful, soft-spoken, and a shard of the primordial dark given human shape.',
 '/assets/images/placeholder.svg',
 'Nashandra is the final antagonist of Drangleic''s cycle. She is a fragment of Manus, Father of the Abyss, given form in the shape of a beautiful queen. She orchestrated the Giant War to harvest their power, seduced Vendrick to gain access to that power, and has manipulated every event in the game to reach the Throne of Want. She attacks with dark miracles, a cursed scythe, and an aura of the Abyss that drains humanity.',
 14310, 120000, 'Lightning', 'Dark', 'Throne of Want — the throne chamber', 2);
