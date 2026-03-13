// Heretic Spellblade — wretch spellblade variant open to Noc and Zizo.
// Medium armor + T1 caster (healing/profane) instead of dodge expert.
// Your miracle is MEANT to suck - your main ability is having
// Medium armor + better stats than regular Slade + Spellblade abilities
// And lesser heal is a bonus on top
/datum/advclass/wretch/zizite_spellblade
	name = "Zizonic Thaumaturge"
	tutorial = "You are an occultist of Zizo, the Archdaemon of Ambition. While her followers usually descend into necromancy and obsession with the blessings of undeath, you remember her secondary teachings: that magic is a tool of true conquest. You combined her gifts with martial discipline, forging yourself into a Thaumaturge — an ancient art from even before the Gilded, now with renewed lyfe. Unlike other spellblades, you know how to wield such terrifying power together with armor."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	allowed_patrons = list(/datum/patron/inhumen/zizo)
	outfit = /datum/outfit/job/roguetown/wretch/heretic_spellblade
	maximum_possible_slots = 2
	class_select_category = CLASS_CAT_ACCURSED
	category_tags = list(CTAG_WRETCH)
	traits_applied = list(TRAIT_MEDIUMARMOR, TRAIT_ARCYNE_T2, TRAIT_OUTDOORSMAN)
	subclass_stats = list(
		STATKEY_STR = 1,
		STATKEY_INT = 2, // Weighted 8. But a very nice statblock
		STATKEY_PER = 1, 
		STATKEY_CON = 2,
		STATKEY_WIL = 2, // With 2 Wil they should not be struggling
	)
	subclass_spell_point_pools = list("utility" = 6)
	subclass_skills = list(
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/magic/arcane = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_NOVICE,
		/datum/skill/magic/holy = SKILL_LEVEL_APPRENTICE, // Welcome to bad holy skills scaling
	)
	subclass_stashed_items = list(
		"Armor Plates" = /obj/item/repair_kit/metal,
	)

/datum/outfit/job/roguetown/wretch/heretic_spellblade
	var/subclass_selected

/datum/outfit/job/roguetown/wretch/heretic_spellblade/Topic(href, href_list)
	. = ..()
	if(href_list["subclass"])
		subclass_selected = href_list["subclass"]
	else if(href_list["close"])
		if(!subclass_selected)
			subclass_selected = "blade"

/datum/outfit/job/roguetown/wretch/heretic_spellblade/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord/heavy
	gloves = /obj/item/clothing/gloves/roguetown/leather
	belt = /obj/item/storage/belt/rogue/leather
	neck = /obj/item/clothing/neck/roguetown/gorget/steel
	backl = /obj/item/storage/backpack/rogue/satchel/short/black
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	wrists = /obj/item/clothing/wrists/roguetown/bracers/iron
	backpack_contents = list(/obj/item/flashlight/flare/torch = 1,
		/obj/item/reagent_containers/glass/bottle/alchemical/healthpot = 1,	
		/obj/item/chalk = 1
	)

	to_chat(H, span_warning("You start with Bind Weapon. Remember to Bind your weapon so you can use your abilities and build up Arcyne Momentum."))

	subclass_selected = null
	// Determine faction and patron-specific weapon for chant display
	var/chant_faction = "zizite"
	var/extra_blade_weapon
	if(istype(H.patron, /datum/patron/inhumen/zizo))
		extra_blade_weapon = "Avantyne Longsword"
	else if(istype(H.patron, /datum/patron/divine/noc))
		chant_faction = "noccite"
	var/selection_html = get_spellblade_chant_html(src, H, chant_faction, extra_blade_weapon)
	H << browse(selection_html, "window=spellblade_chant;size=1100x900")
	onclose(H, "spellblade_chant", src)

	var/open_time = world.time
	while(!subclass_selected && world.time - open_time < 5 MINUTES)
		stoplag(1)
	H << browse(null, "window=spellblade_chant")

	if(!subclass_selected)
		subclass_selected = "blade"

	var/datum/status_effect/buff/arcyne_momentum/momentum = H.apply_status_effect(/datum/status_effect/buff/arcyne_momentum)
	if(momentum)
		momentum.chant = subclass_selected

	if(H.mind)
		switch(subclass_selected)
			if("blade")
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/caedo)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/air_strike)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/leyline_anchor)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/blade_storm)
			if("phalangite")
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/azurean_phalanx)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/azurean_javelin)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/advance)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/gate_of_reckoning)
			if("macebearer")
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/shatter)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/tremor)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/charge)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/cataclysm)

		H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/recall_weapon)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/empower_weapon)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/bind_weapon)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/mending)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/enchant_weapon)

	// Armor choice: Discretion (light, like adventurer) vs Ambition (medium armor set with helmet)
	var/armor_style = list("Discretion (Spellblade Disguise)", "Ambition (Medium Armor)")
	var/armor_choice = input(H, "Choose your armament philosophy.", "HER LIGHT SHINES THROUGH") as anything in armor_style
	switch(armor_choice)
		if("Discretion (Spellblade Disguise)")
			head = /obj/item/clothing/head/roguetown/roguehood/black
			armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat
			cloak = /obj/item/clothing/cloak/raincloak/mortus
		if("Ambition (Medium Armor)")
			armor = /obj/item/clothing/suit/roguetown/armor/brigandine
			pants = /obj/item/clothing/under/roguetown/brigandinelegs
			shoes = /obj/item/clothing/shoes/roguetown/boots/armor
			cloak = /obj/item/clothing/cloak/tabard/stabard/surcoat
			var/helmets = list(
				"Pigface Bascinet"		= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface,
				"Guard Helmet"			= /obj/item/clothing/head/roguetown/helmet/heavy/guard,
				"Bucket Helmet"			= /obj/item/clothing/head/roguetown/helmet/heavy/bucket,
				"Knight Helmet"			= /obj/item/clothing/head/roguetown/helmet/heavy/knight,
				"Armet"					= /obj/item/clothing/head/roguetown/helmet/heavy/knight/armet,
				"Visored Sallet"		= /obj/item/clothing/head/roguetown/helmet/sallet/visored,
				"Hounskull Bascinet"	= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/hounskull,
				"Slitted Kettle"		= /obj/item/clothing/head/roguetown/helmet/heavy/knight/skettle,
				"None"
			)
			var/helmchoice = input(H, "Choose your Helm.", "HER DARKNESS PIERCES THROUGH") as anything in helmets
			if(helmchoice != "None")
				head = helmets[helmchoice]

	backr = /obj/item/rogueweapon/shield/heater

	switch(subclass_selected)
		if("blade")
			var/weapons = list("Avantyne Longsword", "Kriegmesser", "Longsword", "Rapier", "Sabre", "Dagger")
			var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			beltr = /obj/item/rogueweapon/scabbard/sword
			switch(weapon_choice)
				if("Avantyne Longsword")
					r_hand = /obj/item/rogueweapon/sword/long/zizo
					l_hand = /obj/item/rogueweapon/scabbard/sword/noble
				if("Kriegmesser")
					r_hand = /obj/item/rogueweapon/sword/long/kriegmesser
					backr = /obj/item/rogueweapon/scabbard/gwstrap
				if("Longsword")
					r_hand = /obj/item/rogueweapon/sword/long/elvish
					l_hand = /obj/item/rogueweapon/scabbard
				if("Rapier")
					r_hand = /obj/item/rogueweapon/sword/rapier
					l_hand = /obj/item/rogueweapon/scabbard
				if("Sabre")
					r_hand = /obj/item/rogueweapon/sword/sabre/elf
					l_hand = /obj/item/rogueweapon/scabbard
				if("Dagger")
					beltr = /obj/item/rogueweapon/huntingknife/idagger/silver/elvish
					r_hand = /obj/item/rogueweapon/scabbard/sheath/noble
			if(weapon_choice == "Steel Dagger")
				H.adjust_skillrank_up_to(/datum/skill/combat/knives, SKILL_LEVEL_EXPERT, TRUE)
			else
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT, TRUE)
		if("phalangite")
			var/polearm_weapons = list("Halberd", "Bardiche", "Boar Spear", "Dory", "Naginata")
			var/polearm_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in polearm_weapons
			backr = /obj/item/rogueweapon/scabbard/gwstrap
			switch(polearm_choice)
				if("Halberd")
					r_hand = /obj/item/rogueweapon/halberd/glaive/elvish
					backr = /obj/item/rogueweapon/scabbard/gwstrap
				if("Bardiche")
					r_hand = /obj/item/rogueweapon/halberd/bardiche
					backr = /obj/item/rogueweapon/scabbard/gwstrap
				if("Boar Spear")
					r_hand = /obj/item/rogueweapon/spear/boar
					backr = /obj/item/rogueweapon/scabbard/gwstrap
				if("Dory")
					r_hand = /obj/item/rogueweapon/spear/spellblade
					backr = /obj/item/rogueweapon/scabbard/gwstrap
					backr = /obj/item/rogueweapon/shield/heater
				if("Naginata")
					r_hand = /obj/item/rogueweapon/spear/naginata
					backr = /obj/item/rogueweapon/scabbard/gwstrap
					armor = /obj/item/clothing/suit/roguetown/armor/basiceast
			H.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_EXPERT, TRUE)
		if("macebearer")
			var/mace_weapons = list("Steel Mace", "Steel Warhammer", "Grand Mace")
			var/mace_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in mace_weapons
			switch(mace_choice)
				if("Steel Mace")
					r_hand = /obj/item/rogueweapon/mace/steel
				if("Steel Warhammer")
					r_hand = /obj/item/rogueweapon/mace/warhammer/steel
				if("Grand Mace")
					r_hand = /obj/item/rogueweapon/mace/maul/grand
					backr = /obj/item/rogueweapon/scabbard/gwstrap
			H.adjust_skillrank_up_to(/datum/skill/combat/maces, SKILL_LEVEL_EXPERT, TRUE)

	// Patron-specific bonuses
	H.cmode_music = 'sound/music/combat_heretic.ogg'
	switch(H.patron?.type)
		if(/datum/patron/inhumen/zizo)
			H.grant_language(/datum/language/undead)
			ADD_TRAIT(H, TRAIT_GRAVEROBBER, TRAIT_GENERIC)
		if(/datum/patron/divine/noc)
			H.equip_to_slot_or_del(new /obj/item/clothing/neck/roguetown/psicross/noc(H), SLOT_RING, TRUE)

	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_miracles(H, cleric_tier = CLERIC_T1, passive_gain = CLERIC_REGEN_MINOR, devotion_limit = CLERIC_REQ_1, start_maxed = TRUE)
	//Minor regen, T1 only. Cannot progress beyond that (hah). Mostly for self healing.
	wretch_select_bounty(H)
