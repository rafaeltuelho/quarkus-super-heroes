-- new villain
INSERT INTO villain(id, name, otherName, picture, level)
VALUES (nextval('villain_id_seq'), 'Dark Nebula', '', 'https://github.com/cescoffier/supes-data/raw/master/characters/dark-nebula-5121498967616865198.jpg', 230000);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(1, 'Antiforce Manipulation', 'The power to manipulate anti-forces. Sub-power of Physical Force Manipulation. Also Called Anti-Force Control User can create, shape and manipulate anti or negative forces, which work in different ways depending on the force. Anti-gravity would repel objects instead of attract, anti-electromagnetism would cause like charges to attract and opposite charges to repel, anti-friction and anti -viscosity would speed up objects or flow instead of resist them, anti-strong force would cause nuclei to explode, and anti-weak force would cause "radioactive growth" instead of radioactive decay.', 'Antiforce control', 12, 'Major');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 1);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(2, 'Antimatter Manipulation', 'The power to control antimatter. Unlike ordinary matter, antimatter is composed of "antiparticles" which have the same mass of ordinary matter but also opposite charges, as well as other particle properties such as lepton and baryon numbers and quantum spin. This is an incredibly destructive power, as collisions between particles and antiparticles lead to the annihilation of both, ignoring durability in the process and causing an explosive release of energy capable of eclipsing a nuclear bomb with only a small amount of antimatter. The collisions also give rise to variable proportions of intense photons (gamma rays), neutrinos, and less massive particle-antiparticle pairs. The total consequence of annihilation is a release of energy available for work, proportional to the total matter and antimatter mass.', 'null', 12, 'Major');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 2);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(3, 'Corruption', 'Corruption is the ability to "infect" someone or something with one''s power, making said object or person into a different being or state of being than it was before. It''s a lot like Mind Manipulation or Possession, but normally, once infected, the "corruptor" doesn''t have to do anything for the "corrupted" to become corrupted. Corruption can be done not only through the aforementioned methods such as Disease Manipulation, Biological Manipulation, Absorption, and so on, but it can also be done in such a way that there''s no other way to classify it other than corruption. Despite the negative connotation of the word "corruption", it''s possible for this power to be used to make someone a better individual, albeit this is an incredibly rare application.', 'null', 2, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 3);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(4, 'Dark Arts', 'User can utilize the Black Arts: a form of magic typically used for selfish, self-serving and/or nefarious purposes. Though it is not necessarily "evil" magic, dark arts tend to focus toward destruction, harming, cursing and otherwise complicating the lives of other people while advancing the user''s own state. Users often reject social convention and the status quo, which some suggest is in a search for spiritual freedom. As a part of this, they embrace magical techniques and practices that would traditionally be viewed as taboo and are generally willing to go farther than most would even consider if it serves their ends.', 'null', 12, 'Minor');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 4);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(5, 'Dark Magic', 'The ability to allow manipulating aspects of reality (or all of them), bypassing the known laws of physics.', 'null', 25, 'Grand');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 5);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(6, 'Dark Matter Manipulation', 'The ability to manipulate dark matter.', 'null', 12, 'Major');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 6);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(7, 'Darkforce Manipulation', 'Darkforce is a form of extradimensional energy that manifests itself in our universe as a non-reflective, highly opaque, black substance. Certain adepts use psionic, or magical means to draw this energy into our dimension and use it in various ways.', 'null', 25, 'Major');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 7);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(8, 'Aura', 'Ability to have energy envelop the user. It can be used (consciously or subconsciously) for a variety of purposes.', 'null', 2, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 8);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(9, 'Berserk Mode', 'A condition in which a character, due to any psychological or physical effects, falls into an uncontrollable rage. Intelligence is often reduced to the level of animal instincts, and the person in this condition begins with attacking indiscriminately, with increased aggression. However, the person might pose a threat both to enemies and allies. Often accompanied by a sharp increase in attacking capacity at the expense of defense.', 'null', 2, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 9);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(10, 'Conceptual Manipulation', 'The ability to manipulate, create, and/or destroy abstract concepts. This ability has a variety of applications, ranging from not combat applicable to incredibly dominating. Conceptual Manipulation involves the manipulation of universal concepts, and not the universe directly. However, through this power, one can change the universe''s fundamental principles on the highest level.', 'null', 15, 'Major');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 10);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(11, 'Dimensional Awareness', 'The power to detect cross-dimensional portals/barriers within their proximity. The user can sense activity in these portals from their own world. They can go so far as to detect the outer reaches of a dimension', 'null', 3, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 11);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(12, 'Energy Blasts', 'Energy blasts are forms of energy that are expelled from the body, most often from the hands.', 'null', 8, 'Minor');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 12);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(13, 'Flight', 'Flight is an extremely common power used for transportation, allowing the user to lift off the ground and fly through the air. Like many common superpowers, flight was first popularized by Superman', 'null', 3, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 13);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(14, 'Force Fields', 'Force fields are usually invisible or transparent shields of energy that some characters produce as a form of protection. Though force fields are used in many different ways, they are usually shown in comics as a spherical, clear energy field covering the user.', 'null', 6, 'Minor');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 14);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(15, 'Higher Dimensional Manipulation', 'Higher Dimensional Manipulation is the ability to manipulate greater spatial and temporal dimensions than 3-D space, such as 4-D space and above.', 'null', 10, 'Major');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 15);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(16, 'Large Size', 'Some characters have considerably higher measurements than ordinary ones, which causes some of their combat capabilities, especially strength, speed (although agility and maneuverability might be limited), and durability to increase. We call this having a Large Size. This should not be confused with Size Manipulation, as while manipulating one''s size does grant one a larger or smaller size, someone with large size cannot, by default, actually control their size. Examples would be: Hulk, Doomsday, Bane, Optimus Prime, etc.', 'Gigantism, Superhuman Largeness, �?kīness', 2, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 16);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(17, 'Light Control', 'Photokinesis is the ability to control, generate, or absorb light itself. Photokinesis is actually one of the more popular of these types of powers, being shown off by the many Dr. Light characters, Dazzler, and Dagger, to name a few.', 'Photokinesis', 12, 'Major');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 17);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(18, 'Magic', 'Magic is a force often relied upon by certain mystical characters. It is a very wide subject, and the uses of magic vary greatly from character to character. It is often used to simulate other powers, such as reality warping or mind control. Magic is usually the primary force used for fighting off mystical foes such as demons. Famous users of magic include Zatara, his daughter Zatanna, Dr. Strange, and Dr. Fate, to name a few. Each of them uses magic differently, and can wield different magical powers.', 'null', 25, 'Grand');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 18);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(19, 'Matter Manipulation', '', 'null', 12, 'Major');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 19);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(20, 'Mind Control', 'Mind control is generally a superpower for supervillains, where the user takes control over the actions or reasoning of another. Characters with the power of mind control include Maxwell Lord and Purple Man. Limited mind control often comes along with telepathy, as sometimes exhibited specifically by X-Men members, especially Jean Grey and Professor X. This form of telepathy is used most often in Ultimate X-Men.', 'null', 15, 'Major');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 20);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(21, 'Body Puppetry', 'Body Puppetry is the ability to control the body or bodies of others. Unlike Mind Manipulation and Possession, it doesn''t work off controlling the mind or inhabiting a body, rather it functions by controlling another''s body directly from a distance without affecting the soul or mind. However, the result is often extremely similar, so it can often be confused as either the aforementioned abilities, even in-verse.', 'null', 5, 'Minor');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 21);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(22, 'Illumination', 'To produce light from parts or whole body.', 'null', 5, 'Minor');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 22);
-- new villain
INSERT INTO villain(id, name, otherName, picture, level)
VALUES (nextval('villain_id_seq'), 'Rao', '', 'https://github.com/cescoffier/supes-data/raw/master/characters/rao--252954003262452012.jpg', 180000);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(23, 'Accelerated Healing', 'Having accelerated healing generally means the ability to rapidly heal, though this varies on different levels. While Spider-Man can heal from basic injuries much quicker than a regular human, he could not recover from being liquified, unlike Deadpool or the Hulk.', 'Healing Factor, Super Healing', 7, 'Minor');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 23);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(24, 'Agility', 'User with this ability can go from one motion to another effortlessly, effectively dodge attacks, swing from things easily, sprint, do back-flips, leap across rooftops, and numerous other gymnastic, athletic and martial implements with little to no effort. Agility is "the ability to rapidly respond or change by adapting its initial stable configuration", the ability to change the body''s position efficiently, and requires the integration of isolated movement skills using a combination of balance, bodily coordination, speed, reflexes, strength, and endurance.', 'Augmented Agility', 1, 'Ability');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 24);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 8);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(25, 'Chi Manipulation', 'Chi Manipulation (also known as Ki Manipulation) is the manipulation of a natural energy coursing within the body known as Chi, Qi, Ki, Youki, and many other names. This ability appears most frequently in Eastern media, where the concept of Chi was first derived, and is typically associated with Martial Arts.', 'null', 2, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 25);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(26, 'Cold Resistance', 'The power/ability to be resistant or immune to one, some, or all forms of cold.', 'Coldproof, Cold Invulnerability, Cold Resistance, Cryokinetic Immunity,', 3, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 26);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(27, 'Durability', 'Resistance to physical injury.', 'null', 0, 'Stat');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 27);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(28, 'Electricity Resistance', 'Not being injured from some or all types of electricity.', 'null', 3, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 28);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(29, 'Endurance', 'The ability to endure difficult or unpleasant stresses beyond the limits and capabilities of the greatest humans. This attribute differs from Stamina as it enables users to do things such as operating on a "low power setting" (being able to operate efficiently for extended amounts of time), holding their breath for large periods of time, remain calm through stressful or painful situations, tolerate extreme hunger, unbearable thirst, and strong urges to sleep.', 'Stress Tolerance, Resilience', 2, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 29);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(30, 'Energy Absorption', 'Ability to absorp energy in one or many forms. This could make an energy attack less damaging or not damage at all. Some characters can reuse this energy to their advantage. Characters can also absorpt ambient energy and use it to their advantage; create forcefields, energy blasts, etc.', 'null', 12, 'Major');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 30);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(31, 'Energy Manipulation', 'The ability to control and generate various forms of energy.', 'null', 25, 'Grand');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 31);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(32, 'Energy Resistance', '', 'null', 6, 'Minor');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 32);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(33, 'Fire Resistance', 'Not being injured from some or all types of fire.', 'null', 5, 'Minor');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 33);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 13);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(34, 'Heat Resistance', 'Virtually immune to the effects of most or all forms of heat.', 'null', 2, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 34);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(35, 'Intelligence', 'Super intelligence is not always considered a superpower, and can just be a quality that a superhero possesses. One of the original superheroes, Doc Savage had extraordinary intelligence. However, some characters such as the villainous Leader have received their intelligence unnaturally as a superpower.', 'null', 0, 'Stat');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 35);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(36, 'Invulnerability', 'Invulnerability was yet another power first shown by Superman, though it grew to be a much more common power. Invulnerability is basically the term for the ability to be impervious to harm without extreme measures. Other characters that have shown this ability include the Hulk and Wonder Woman.', 'null', 8, 'Minor');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 36);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(37, 'Jump', 'The ability to leap incredibly high and far was first made popular by Superman who was ''able to leap tall buildings in a single bound.'' Superman''s mode of transportation was later enhanced to flight. Some superheros still use super jumps as a means of transportation. These include Hulk and Spider-Man.', 'null', 2, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 37);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(38, 'Levitation', 'Often confused with Flying, Levitation is the ability to use the mind to be lifted off the ground and sent through the air. It can basically be seen as self-applied telekinesis. This power can be seen used by Martian Manhunter, Jean Grey, and others.', 'null', 3, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 38);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(39, 'Longevity', 'Slowing down of even stop the effects of aging.', 'null', 5, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 39);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(40, 'Marksmanship', 'Super accuracy is basically an ability to be an incredible marksman. This would mean that when the user throws an object, for instance, they will never miss the target they are throwing at. Characters with super accuracy are often assassins-for-hire.', 'Accuracy', 2, 'Ability');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 40);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(41, 'Master Tactician', 'The ability to be an extremely skilled strategic genius and apply this skill to several objectives.', 'null', 2, 'Ability');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 41);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(42, 'Acrobatics', 'The technique of performing maneuvers of balance, dexterity, agility, and coordination. In fiction, the levels of acrobatics can vary between simply performing extraordinary human movements to defiance of the laws of gravity and movement.', 'null', 1, 'Ability');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 42);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(43, 'Adaptation', 'Adaptation is the power to gain immumity to something after first exposure, so the same trick never works twice. Doomsday has been able to fight Superman over and over again thanks to this ability.', 'null', 5, 'Minor');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 43);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(44, 'Biokinesis', 'Biokinesis is the ability to control DNA. Biokinetics can shapeshift, alter their body composition and other things relating to the human body.', 'null', 14, 'Major');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 44);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(45, 'Danger Sense', 'Danger sense is the ability to, simply put, sense danger. It is a limited form of Precognition. This power is often given different names, and like most mental powers, varies greatly from person to person. Spider-Man''s danger sense is called his ''spider-sense'', and alerts him when danger is near, though he does not always know the specifics of the danger.', 'null', 3, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 45);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(46, 'Dexterity', 'Skillfulness in the use of the hands or body.', 'null', 1, 'Ability');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 46);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(47, 'Empathy', 'Super empathy, while not a very popular power, can be useful in some situations. Super empathy varies in use, often being psychic or magical in nature. Some super empathy is so strong that it actually allows the empath to use the powers and abilities of the person.', 'null', 2, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 47);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(48, 'Energy Beams', 'The ability to generate or transform various forms of energy into a "solid" or concussive beam of energy.', 'null', 12, 'Major');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 48);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 12);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(49, 'Energy Constructs', 'Ability to create constructs made of energy. Often the shape is limited by the creators imagination.', 'null', 6, 'Minor');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 49);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(50, 'Enhanced Hearing', 'Also known as Super Hearing. The ability to perceive sounds of varying volume or pitch beyond the scope of normal human capability. Some individuals possessing enhanced hearing can develop enough control to block out ambient sounds to focus on a specific source or frequency. As such, they can identify a person by their heartbeat, or pick out a single voice in an entire city. Cybernetic characters may possess mechanical components which likewise enable them to hear with greater scope and clarity.', 'null', 2, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 50);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(51, 'Enhanced Memory', 'The ability to quickly absorb and accurately retain great amounts of information.', 'null', 2, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 51);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(52, 'Enhanced Smell', 'The ability to identify scents with greater precision than the average human being. This ability is particularly useful for tracking prey, perceiving the invisible, or navigating in an unfamiliar environment.', 'null', 2, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 52);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(53, 'Heat Generation', 'The ability to generate, control and absorb thermal energy or molecular motion. In comics, this power can be used in a multitude of ways such as flight, by heating the air around the user to make them rise', 'Thermokinesis', 3, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 53);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 22);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(54, 'Indomitable Will', 'An ability where the user has unnaturally strong willpower, enabling them to be immune to all forms of temptation, such as subordination, telepathy, mind control, and seduction. The user can face great physical pain and psychological trauma and will refuse to surrender no matter how much the odds are stacked against them, possibly up to the point of cheating death and pushing themselves past their own limitations.', 'null', 2, 'Ability');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 54);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(55, 'Master Martial Artist', 'A master of different techniques of attacking and self-defense, with the purpose of physical and/or spiritual self-improvement. Some fictional characters often pass regular limits and become akin to superhuman (there are a lot of tales and legends about the miracles that some real life martial artists were capable of all as well).', 'null', 2, 'Ability');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 55);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(56, 'Cryokinesis', 'Ability to reduce the kinetic energy of atoms and thus reduce temperature, often used to control, generate, or absorb ice.', 'Ice Manipulation', 12, 'Minor');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 56);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(57, 'Life Manipulation', 'The ability to manipulate the life force that courses inside living beings or the very concept of life itself.', 'null', 96, 'Grand');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 57);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(58, 'Non-Physical Interaction', 'The power to interact with intangible or non-corporeal beings. Users can both see and interact with intangible, or non-corporeal, abstract, and nonexistent life-forms and entities, allowing them to make physical contact and possibly cause harm.', 'null', 2, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 58);
-- new villain
INSERT INTO villain(id, name, otherName, picture, level)
VALUES (nextval('villain_id_seq'), 'Wanderer', '', 'https://github.com/cescoffier/supes-data/raw/master/characters/wanderer-300775911119209178.jpg', 1000000);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 20);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(59, 'Mind Control Resistance', '', 'null', 8, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 59);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(60, 'Omnilingualism', 'Omnilingualism is the ability to decipher any language. This is not a common power, though one notable user of omnilingualism is Cypher of the New Mutants. Starfire also has a form of omnilingualism. She can instantly learn a being''s language through physical contact with that being. The Pre-Crisis version of Superman knew nearly all Earthly and alien languages, effectively giving him this power.', 'null', 5, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 60);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(61, 'Omnimimicry', 'A power to turn ones self into any type of energy, matter, animal or character.', 'null', 15, 'Major');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 61);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(62, 'Animal Control', 'The user can control animals, they can set stampedes onto attackers, get animals to fetch things.', 'null', 5, 'Minor');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 62);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(63, 'Audio Control', 'The ability to mentally manipulate sound waves.', 'Audiokinesis, Sound Control', 12, 'Major');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 63);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(64, 'Omnifabrication', 'To build things with ease', 'null', 12, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 64);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(65, 'Omni-Sense', 'The ability to see through space and time from any location.', 'null', 8, 'Minor');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 65);
-- new villain
INSERT INTO villain(id, name, otherName, picture, level)
VALUES (nextval('villain_id_seq'), 'Phantom Dharak', 'Dharak', 'https://github.com/cescoffier/supes-data/raw/master/characters/dharak-4735040098648148723.jpg', 1000000);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 23);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 43);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 24);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 9);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(66, 'Bloodlust', 'A state where a character is fighting without any inhibitions and cares about nothing other than defeating the enemy.', 'null', 1, 'Ability');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 66);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 26);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 4);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 7);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 27);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(67, 'Elasticity', 'Elasticity is a power allowing the user to stretch his or her body, like rubber, into any shape or form the user wants. This power was first famously used by Plastic Man, though the original elastic character was Ping the Elastic Man, who predated Plastic Man by two years. The power was also used by characters such as Elongated Man, Mr. Fantastic, and Elasti-Girl.', 'null', 10, 'Minor');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 67);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(68, 'Electricity Absorption', 'Ability to electricity absorb in one or many forms. This could make an energy attack less damaging or not damage at all.', 'null', 4, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 68);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 28);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 29);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 30);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(69, 'Energy Armor', 'Energy armor is a field of energy protecting a character, using an advanced form of energy control. Energy armor is usually manifested in form of some outer shell, with the controller as the heart of the armor. This is usually used to enhance the controller''s power.', 'null', 3, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 69);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 48);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 12);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 49);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(70, 'Energy Embodiment', 'The user becomes the physical manifestation or representation of a form/all forms of energy in their reality, gaining limitless control over that energy and all energy-based powers.', 'null', 48, 'Grand');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 70);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 31);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 32);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 50);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 51);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 52);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(71, 'Enhanced Thievery', 'The ability to possess skills that allow one to rob, steal, and loot like a master thief. Masters of this skill are more elusive than the average thief. They are able to blend in with the shadows, slip into tight spaces, avoid detection from guards, and escape without leaving behind any evidence.', 'null', 1, 'Ability');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 71);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(72, 'Enhanced Touch', '', 'null', 2, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 72);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 13);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 14);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 34);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(73, 'Hellfire Resistance', 'The power/ability to be resistant or immune to one, some, or all forms of hellfire.', 'null', 5, 'Minor');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 73);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(74, 'Immortality', 'Immortality is the ability to live forever, eternal life, being exempt from death; unending existence.', 'null', 14, 'Major');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 74);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 35);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 36);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(75, 'Natural Weapons', 'Natural weapons are especially associated with animal-like characters, as they include thing such as claws and sharp teeth, as well as quills, spines, and many other qualities usually derived from animals.', 'null', 3, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 75);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(76, 'Awakened Power', 'A sudden burst of power triggered by sheer determination or a powerful emotion. All the physical/mental abilities get heightened for a short amount of time, usually followed by a period of exhaustion or vulnerability. It differs from other similar powers such as: "Berserk Mode" or "Rage Power" because the user is still under control, able to think and act rational, not fueled by rage or blinded by emotions.', 'null', 7, 'Minor');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 76);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(77, 'Bullet Time', 'May be confused with superspeed, bullet time is the ability to slow down time perceptually, in order to fight at such extraordinary speeds that the hero can''t be hit or shot. This ability became popular through the 1999 movie The Matrix. It can be seen used by Neo, Morpheus, and others. The effect originally appeared in the first Blade movie.', 'null', 12, 'Major');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 77);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(78, 'Changing Armor', 'Changing armor is a unique type of armor capable of changing from one form to another, or changing pieces of the armor into tools or weapons. The armor can also repair itself from damage. The armor may be organic and have a mind of its own, like Spawn, Venom, and Witchblade. Or it may be mechanical, like Hardware or Iron Man.', 'null', 2, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 78);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 45);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 46);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(79, 'Dimensional Travel', 'Ability to travel to other dimensions.', 'null', 10, 'Major');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 79);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(80, 'Emotional Power Up', 'The ability to power up by emotion', 'null', 2, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 80);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(81, 'Fire Control', 'Pyrokinesis is the ability to control, generate, or absorb fire. The first popular pyrokinetic in comics was the Golden Age Human Torch. The power later evolved and characters such as Fire, Pyro, and the second Human Torch were also given pyrokinesis.', 'Pyrokinesis', 6, 'Minor');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 81);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 33);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(82, 'Invisibility', 'The power to render oneself unable to be seen.', 'null', 6, 'Minor');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 82);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 37);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 41);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(83, 'Natural Armor', 'Natural armor is a power that exists in real life, in animals such as armadillos and tortoises. Not surprisingly, this quality has also been applied to extremely tough superheroes such as the Thing. Natural armor often provides a form of invulnerability, like the armor of Colossus or the Thing.', 'null', 3, 'Base');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 83);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 54);
INSERT INTO power(id, name, description, aliases, score, tier)
VALUES(84, 'Intangibility', 'The ability to phase through physical matter.', 'null', 5, 'Minor');
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 84);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 39);
INSERT INTO villain_power(villain_id, power_id)
VALUES(currval('villain_id_seq'), 59);

ALTER SEQUENCE power_id_seq RESTART WITH 85;