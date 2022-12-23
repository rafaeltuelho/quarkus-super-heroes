-- new hero
INSERT INTO hero(id, name, otherName, picture, level)
VALUES (nextval('hero_id_seq'), 'Zacama', '', 'https://github.com/rafaeltuelho/supes-data/raw/master/characters/zacama--7200164914940329828.jpg', 15000);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(1, 'Acid Resistants', 'The power to be resistant to highly corrosive substances', 'null', 2, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 1);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(2, 'Animal Attributes', 'The ability to have any type of attribute of any type of animal, such as flying like a bird, but without wings for example.', 'null', 2, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 2);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(3, 'Animal Oriented Powers', 'Some powers are oriented around one animal or a specific animal appendage. The main animal appendages are the wings of a bird (but super sized to fit a human), the claws of a cat or other clawed animal, the skin of an armadillo, or the fins and gills of a fish. Hawkman is hawk-oriented, Spider-Man is spider-oriented, and (surprise, surprise) Cheetah is cheetah-oriented.', 'null', 2, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 3);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(4, 'Bloodlust', 'A state where a character is fighting without any inhibitions and cares about nothing other than defeating the enemy.', 'null', 1, 'Ability');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 4);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(5, 'Damage Boost', 'Also called Damage Amplification or Attack Boost, Damage Boost is an ability where the user can increase and amplify the damage the target takes making them easier to defeat or destroy. This differs from Statistics Amplification in the fact that the user isn''t boosted, rather the attack itself. The effect is temporary, lasting as long as the condition allowing for its increased power is met. Due to this, the attack''s usage is normally boosted considerably.', 'null', 8, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 5);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(6, 'Endurance', 'The ability to endure difficult or unpleasant stresses beyond the limits and capabilities of the greatest humans. This attribute differs from Stamina as it enables users to do things such as operating on a "low power setting" (being able to operate efficiently for extended amounts of time), holding their breath for large periods of time, remain calm through stressful or painful situations, tolerate extreme hunger, unbearable thirst, and strong urges to sleep.', 'Stress Tolerance, Resilience', 2, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 6);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(7, 'Enhanced Smell', 'The ability to identify scents with greater precision than the average human being. This ability is particularly useful for tracking prey, perceiving the invisible, or navigating in an unfamiliar environment.', 'null', 2, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 7);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(8, 'Fire Control', 'Pyrokinesis is the ability to control, generate, or absorb fire. The first popular pyrokinetic in comics was the Golden Age Human Torch. The power later evolved and characters such as Fire, Pyro, and the second Human Torch were also given pyrokinesis.', 'Pyrokinesis', 6, 'Minor');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 8);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(9, 'Fire Resistance', 'Not being injured from some or all types of fire.', 'null', 5, 'Minor');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 9);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(10, 'Heat Generation', 'The ability to generate, control and absorb thermal energy or molecular motion. In comics, this power can be used in a multitude of ways such as flight, by heating the air around the user to make them rise', 'Thermokinesis', 3, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 10);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(11, 'Heat Resistance', 'Virtually immune to the effects of most or all forms of heat.', 'null', 2, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 11);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(12, 'Hunters Instinct', 'The ability to sense or handle stealth, hunting, and survival situations by experience', 'null', 1, 'Ability');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 12);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(13, 'Instinctive Reaction', 'The ability to react to oncoming attacks without the need for conscious thought. As such, those with this ability will automatically dodge and possibly counter oncoming attacks through muscle memory or instinct. As a result, the user is free to utilize the mental effort that is normally spent on performing these movements on other things.', 'null', 2, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 13);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(14, 'Invulnerability', 'Invulnerability was yet another power first shown by Superman, though it grew to be a much more common power. Invulnerability is basically the term for the ability to be impervious to harm without extreme measures. Other characters that have shown this ability include the Hulk and Wonder Woman.', 'null', 8, 'Minor');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 14);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(15, 'Jaw Strength', 'Having a large bite force.', 'null', 2, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 15);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(16, 'Large Size', 'Some characters have considerably higher measurements than ordinary ones, which causes some of their combat capabilities, especially strength, speed (although agility and maneuverability might be limited), and durability to increase. We call this having a Large Size. This should not be confused with Size Manipulation, as while manipulating one''s size does grant one a larger or smaller size, someone with large size cannot, by default, actually control their size. Examples would be: Hulk, Doomsday, Bane, Optimus Prime, etc.', 'Gigantism, Superhuman Largeness, �?kīness', 2, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 16);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(17, 'Longevity', 'Slowing down of even stop the effects of aging.', 'null', 5, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 17);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(18, 'Magic', 'Magic is a force often relied upon by certain mystical characters. It is a very wide subject, and the uses of magic vary greatly from character to character. It is often used to simulate other powers, such as reality warping or mind control. Magic is usually the primary force used for fighting off mystical foes such as demons. Famous users of magic include Zatara, his daughter Zatanna, Dr. Strange, and Dr. Fate, to name a few. Each of them uses magic differently, and can wield different magical powers.', 'null', 25, 'Grand');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 18);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(19, 'Magic Resistance', 'Completely or partially resistant to magic.', 'null', 16, 'Major');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 19);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(20, 'Multiple Limbs', '', 'null', 2, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 20);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(21, 'Natural Armor', 'Natural armor is a power that exists in real life, in animals such as armadillos and tortoises. Not surprisingly, this quality has also been applied to extremely tough superheroes such as the Thing. Natural armor often provides a form of invulnerability, like the armor of Colossus or the Thing.', 'null', 3, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 21);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(22, 'Natural Weapons', 'Natural weapons are especially associated with animal-like characters, as they include thing such as claws and sharp teeth, as well as quills, spines, and many other qualities usually derived from animals.', 'null', 3, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 22);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(23, 'Accelerated Healing', 'Having accelerated healing generally means the ability to rapidly heal, though this varies on different levels. While Spider-Man can heal from basic injuries much quicker than a regular human, he could not recover from being liquified, unlike Deadpool or the Hulk.', 'Healing Factor, Super Healing', 7, 'Minor');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 23);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(24, 'Animal Control', 'The user can control animals, they can set stampedes onto attackers, get animals to fetch things.', 'null', 5, 'Minor');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 24);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(25, 'Berserk Mode', 'A condition in which a character, due to any psychological or physical effects, falls into an uncontrollable rage. Intelligence is often reduced to the level of animal instincts, and the person in this condition begins with attacking indiscriminately, with increased aggression. However, the person might pose a threat both to enemies and allies. Often accompanied by a sharp increase in attacking capacity at the expense of defense.', 'null', 2, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 25);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(26, 'Cold Resistance', 'The power/ability to be resistant or immune to one, some, or all forms of cold.', 'Coldproof, Cold Invulnerability, Cold Resistance, Cryokinetic Immunity,', 3, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 26);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(27, 'Corruption Resistance', 'The power/ability to be resistant or immune to one, some, or all forms of Corruption.', 'null', 2, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 27);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(28, 'Curse Resistance', '', 'null', 3, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 28);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(29, 'Electricity Resistance', 'Not being injured from some or all types of electricity.', 'null', 3, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 29);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(30, 'Energy Resistance', '', 'null', 6, 'Minor');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 30);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(31, 'Enhanced Hearing', 'Also known as Super Hearing. The ability to perceive sounds of varying volume or pitch beyond the scope of normal human capability. Some individuals possessing enhanced hearing can develop enough control to block out ambient sounds to focus on a specific source or frequency. As such, they can identify a person by their heartbeat, or pick out a single voice in an entire city. Cybernetic characters may possess mechanical components which likewise enable them to hear with greater scope and clarity.', 'null', 2, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 31);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(32, 'Holy Resistance', 'The power/ability to be resistant or immune to one, some, or all forms of Holy Manipulation.', 'null', 6, 'Minor');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 32);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(33, 'Illumination', 'To produce light from parts or whole body.', 'null', 5, 'Minor');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 33);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(34, 'Immortality', 'Immortality is the ability to live forever, eternal life, being exempt from death; unending existence.', 'null', 14, 'Major');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 34);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(35, 'Indomitable Will', 'An ability where the user has unnaturally strong willpower, enabling them to be immune to all forms of temptation, such as subordination, telepathy, mind control, and seduction. The user can face great physical pain and psychological trauma and will refuse to surrender no matter how much the odds are stacked against them, possibly up to the point of cheating death and pushing themselves past their own limitations.', 'null', 2, 'Ability');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 35);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(36, 'Light Control', 'Photokinesis is the ability to control, generate, or absorb light itself. Photokinesis is actually one of the more popular of these types of powers, being shown off by the many Dr. Light characters, Dazzler, and Dagger, to name a few.', 'Photokinesis', 12, 'Major');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 36);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(37, 'Mind Control Resistance', '', 'null', 8, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 37);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(38, 'Multiple Personalities', 'Also called Divided Mind, Multiple Personalities is the ability to have two or personalities in the mind. By switching between personalities, the user''s body can change and gain different powers, abilities, skills, or physical and mental attributes. Users with Multiple Personalities may have collective intelligence (the user has a consciousness that allows them to replace a strategic headquarters or scientific institute with enough organization), a mental resistance (a consciousness that allows resistance to mental influences because even if one of them succumbs to external control, the other personalities immediately bring the wayward), or even a strong personality that can be activated in some ways when there''s a need for its services. Of course, the personalities are still autonomous and memory may be lost when switched with another personality or one of the personalities may unknowingly erase the memories that are important to the other. Because there''s no mental direction at the other faculties of the body, one dominant personality has to constantly watch all the other consciousness which severely limits other abilities in certain situations.', 'null', 3, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 38);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(39, 'Divinity', 'The power to have powers from a divine source. Opposite to Demonic Source. The user has divinity and divine powers granting them an immense amount of raw power beyond the mundane, making users a divine being by nature, a status which can be obtained a number of different ways. Users can gain divinity by having a divine ancestry, transform into a deity either by another god or by faith, channels, acts as a vessel for, the power/soul of a deity, mimic/steal powers from a deity, or be enhanced/evolved to the point of godhood. The level and forms of divinity is variable and unique by the user''s nature and character of being, thus weaker or stronger users of divinities is ultimately reliant on the user alone.', 'null', 10, 'Major');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 39);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(40, 'Holy Manipulation', 'The ability to manipulate divine or sacred energy and/or objects pertaining to such forces. It is a very broad term that has a variety of applications and frequently intersects with Light Manipulation, Healing, Magic, and other abilities generally considered to fall under the "good" or "lawful". Due to its nature, it is often extremely effective against those deemed "evil" or "monstrous", serving as a weakness to many characters under those categories.', 'null', 12, 'Major');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 40);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(41, 'Life Manipulation', 'The ability to manipulate the life force that courses inside living beings or the very concept of life itself.', 'null', 96, 'Grand');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 41);
-- new hero
INSERT INTO hero(id, name, otherName, picture, level)
VALUES (nextval('hero_id_seq'), 'Sanar', '', 'https://github.com/rafaeltuelho/supes-data/raw/master/characters/sanar-2730887768566219320.jpg', 2000000);
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 23);
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 26);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(42, 'Creation', 'The ability to create anything from nothing.', 'null', 30, 'Grand');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 42);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(43, 'Durability', 'Resistance to physical injury.', 'null', 0, 'Stat');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 43);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(44, 'Energy Manipulation', 'The ability to control and generate various forms of energy.', 'null', 25, 'Grand');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 44);
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 9);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(45, 'Flight', 'Flight is an extremely common power used for transportation, allowing the user to lift off the ground and fly through the air. Like many common superpowers, flight was first popularized by Superman', 'null', 3, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 45);
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 11);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(46, 'Intelligence', 'Super intelligence is not always considered a superpower, and can just be a quality that a superhero possesses. One of the original superheroes, Doc Savage had extraordinary intelligence. However, some characters such as the villainous Leader have received their intelligence unnaturally as a superpower.', 'null', 0, 'Stat');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 46);
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 41);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(47, 'Molecular Manipulation', 'The ability to manipulate energy and matter on a molecular level, which could be either the users own matter or that of their surroundings and nature.', 'null', 10, 'Major');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 47);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(48, 'Agility', 'User with this ability can go from one motion to another effortlessly, effectively dodge attacks, swing from things easily, sprint, do back-flips, leap across rooftops, and numerous other gymnastic, athletic and martial implements with little to no effort. Agility is "the ability to rapidly respond or change by adapting its initial stable configuration", the ability to change the body''s position efficiently, and requires the integration of isolated movement skills using a combination of balance, bodily coordination, speed, reflexes, strength, and endurance.', 'Augmented Agility', 1, 'Ability');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 48);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(49, 'Black Hole Manipulation', 'The power to manipulate black holes. As a subset of Gravity Manipulation, Black Hole Manipulation allows the user to create, shape and manipulate black holes, regions of space-time where gravity prevents light and anything else from escaping. The user can also control the size of a black hole and move it around in space to absorb everything in its way. Since their immense gravity slows time, black holes can allow Time Travel to the future; if a few minutes or hours passes for the user near the event horizon, they may find it''s hundreds of years in the future when they leave.', 'null', 12, 'Major');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 49);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(50, 'Chi Manipulation', 'Chi Manipulation (also known as Ki Manipulation) is the manipulation of a natural energy coursing within the body known as Chi, Qi, Ki, Youki, and many other names. This ability appears most frequently in Eastern media, where the concept of Chi was first derived, and is typically associated with Martial Arts.', 'null', 2, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 50);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(51, 'Cosmic Awareness', 'Power to be aware of anything that affects the user on a universal scale.', 'null', 2, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 51);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(52, 'Dexterity', 'Skillfulness in the use of the hands or body.', 'null', 1, 'Ability');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 52);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(53, 'Dimensional Travel', 'Ability to travel to other dimensions.', 'null', 10, 'Major');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 53);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(54, 'Energy Constructs', 'Ability to create constructs made of energy. Often the shape is limited by the creators imagination.', 'null', 6, 'Minor');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 54);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(55, 'Existence Erasure Resistance', 'The ability to resist existence erasure (erasure from reality which includes the physical body, mind, and soul).', 'null', 64, 'Grand');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 55);
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 10);
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 34);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(56, 'Intangibility', 'The ability to phase through physical matter.', 'null', 5, 'Minor');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 56);
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 14);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(57, 'Jump', 'The ability to leap incredibly high and far was first made popular by Superman who was ''able to leap tall buildings in a single bound.'' Superman''s mode of transportation was later enhanced to flight. Some superheros still use super jumps as a means of transportation. These include Hulk and Spider-Man.', 'null', 2, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 57);
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 37);
-- new hero
INSERT INTO hero(id, name, otherName, picture, level)
VALUES (nextval('hero_id_seq'), 'Ozymandias', 'Adrian Veidt', 'https://github.com/rafaeltuelho/supes-data/raw/master/characters/adrian-veidt-3108068402515691181.jpg', 116);
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 48);
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 52);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(58, 'Information Analysis', 'The ability to gain information on a character or object by analyzing them. A basic analysis can grant only rudimentary data on the target, such as their level of strength, speed, durability, or intelligence, while more powerful analyses can grant extensive information on the target''s abilities and even personal history. This ability often overlaps with Power Mimicry, allowing a character to copy another after analyzing them.', 'null', 1, 'Ability');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 58);
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 46);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(59, 'Master Martial Artist', 'A master of different techniques of attacking and self-defense, with the purpose of physical and/or spiritual self-improvement. Some fictional characters often pass regular limits and become akin to superhuman (there are a lot of tales and legends about the miracles that some real life martial artists were capable of all as well).', 'null', 2, 'Ability');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 59);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(60, 'Master Tactician', 'The ability to be an extremely skilled strategic genius and apply this skill to several objectives.', 'null', 2, 'Ability');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 60);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(61, 'Acrobatics', 'The technique of performing maneuvers of balance, dexterity, agility, and coordination. In fiction, the levels of acrobatics can vary between simply performing extraordinary human movements to defiance of the laws of gravity and movement.', 'null', 1, 'Ability');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 61);
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 26);
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 6);
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 31);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(62, 'Enhanced Memory', 'The ability to quickly absorb and accurately retain great amounts of information.', 'null', 2, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 62);
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 11);
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 57);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(63, 'Marksmanship', 'Super accuracy is basically an ability to be an incredible marksman. This would mean that when the user throws an object, for instance, they will never miss the target they are throwing at. Characters with super accuracy are often assassins-for-hire.', 'Accuracy', 2, 'Ability');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 63);
-- new hero
INSERT INTO hero(id, name, otherName, picture, level)
VALUES (nextval('hero_id_seq'), 'Speed', 'Thomas Maximoff', 'https://github.com/rafaeltuelho/supes-data/raw/master/characters/thomas-maximoff-7571086382637793413.jpg', 82);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(64, 'Age Manipulation', 'The ability to control the age of one''s self, other organisms, and or objects. This can be used in a variety of ways, such as returning a target to a much younger state, rendering them a helpless child, or to rapidly age others, to old age and potentially even their death. In some cases, this effect is so powerful that it can reduce a user''s surroundings to dust.', 'null', 14, 'Major');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 64);
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 48);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(65, 'Aura', 'Ability to have energy envelop the user. It can be used (consciously or subconsciously) for a variety of purposes.', 'null', 2, 'Base');
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 65);
INSERT INTO hero_power(hero_id, power_id)
VALUES(currval('hero_id_seq'), 57);

ALTER SEQUENCE power_id_seq RESTART WITH 66;