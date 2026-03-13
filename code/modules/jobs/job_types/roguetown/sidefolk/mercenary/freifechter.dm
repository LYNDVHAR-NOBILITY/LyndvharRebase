/datum/advclass/mercenary/freelancer
	name = "Khaliphate Almubaraz"
	tutorial = "You are a warrior of the Khaliphate, a well-renowned Almubaraz - \"Swordsmen\" - and part of a prestigious lineage of highly-trained warriors localized in the grand city of Sohayrah. It was formed an odd one hundred yils ago, but its visitors come from all parts of the Khaliphate. You have swung one weapon ten-thousand times, and not the other way around. You've left your cradle in search of riches to fund your people's armies- primarily in the ruins of Lyndhardtia."
	extra_context = "This class is for experienced players who have a solid grasp on footwork and stamina management, master skills alone won't save your lyfe. You make up for your inherent weaknesses and limitations with \"master strike\" mechanics."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
	outfit = /datum/outfit/job/roguetown/mercenary/freelancer
	subclass_languages = list(/datum/language/celestial)
	class_select_category = CLASS_CAT_KHAZUMIA
	category_tags = list(CTAG_MERCENARY)
	cmode_music = 'sound/music/frei_fencer.ogg'
	traits_applied = list(TRAIT_BADTRAINER, TRAIT_INTELLECTUAL, TRAIT_LONGSWORDSMAN, TRAIT_FENCERDEXTERITY, TRAIT_KHAZUMIA)
	subclass_stats = list(
		STATKEY_INT = 3,
		STATKEY_PER = 3,
		STATKEY_WIL = 3
	)
	subclass_skills = list(
		/datum/skill/combat/swords = SKILL_LEVEL_MASTER,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_MASTER,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/sewing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE
	)
	adv_stat_ceiling = list(STAT_STRENGTH = 12, STAT_SPEED = 12, STAT_CONSTITUTION = 10)

/datum/outfit/job/roguetown/mercenary/freelancer/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, span_warning("You are a master in the arts of the longsword. Wielder of Beowricke's most versatile and noble weapon, you needn't anything else."))
	l_hand = /obj/item/rogueweapon/scabbard/sword
	var/weapons = list("Calmirixian Longsword", "Valorian Longsword")
	if(H.mind)
		var/weapon_choice = input(H, "Draw a sword.", "As presented to me by Master Kadin Latif...") as anything in weapons
		switch(weapon_choice)
			if("Calmirixian Longsword")		//A longsword with a compound ricasso. Accompanied by a traditional flip knife.
				r_hand = /obj/item/rogueweapon/sword/long/calmirixia
				beltr = /obj/item/rogueweapon/huntingknife/idagger/navaja/freifechter
			if("Valorian Longsword")
				r_hand = /obj/item/rogueweapon/sword/long/calmirixia/freifechter
				beltr = /obj/item/rogueweapon/huntingknife/idagger/navaja/freifechter

		if(H.mind)
			var/armors = list(
				"Fencing Jacket"	= /obj/item/clothing/suit/roguetown/armor/leather/heavy/freifechter,
				"Fencing Cuirass"	= /obj/item/clothing/suit/roguetown/armor/plate/cuirass/fencer
			)
			var/armorchoice = input(H, "Don your armour.", "Security or Flexibility?") as anything in armors
			armor = armors[armorchoice]

	belt = /obj/item/storage/belt/rogue/leather/battleskirt/black
	beltl = /obj/item/flashlight/flare/torch/lantern
	shirt = /obj/item/clothing/suit/roguetown/shirt/robe/hierophant
	pants = /obj/item/clothing/under/roguetown/trou/leather/eastern
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	gloves = /obj/item/clothing/gloves/roguetown/eastgloves1
	backr = /obj/item/storage/backpack/rogue/satchel/short
	wrists = /obj/item/clothing/neck/roguetown/psicross/khazumia
	head = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/black
	mask = /obj/item/clothing/mask/rogue/lordmask/khazumia

	backpack_contents = list(
		/obj/item/roguekey/mercenary = 1,
		/obj/item/natural/bundle/cloth/bandage/full = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1
		)	
	H.merctype = 6

/datum/advclass/mercenary/freelancer/lancer
	name = "Khaliphate Lansir"
	tutorial = "You are a warrior of the Khaliphate, a well-renowned Lansir - \"Lancer\" - and part of a prestigious lineage of highly-trained warriors localized in the grand city of Sohayrah. It was formed an odd one hundred yils ago, but its visitors come from all parts of the Khaliphate. You have swung one weapon ten-thousand times, and not the other way around. You've left your cradle in search of riches to fund your people's armies- primarily in the ruins of Lyndhardtia."
	extra_context = "This class is for experienced players who have a solid grasp on footwork and stamina management, master skills alone won't save your lyfe. You make up for your inherent weaknesses and limitations with unique high-durability weapons."
	cmode_music = 'sound/music/frei_lancer.ogg'
	outfit = /datum/outfit/job/roguetown/mercenary/freelancer_lancer
	subclass_languages = list(/datum/language/celestial)
	traits_applied = list(TRAIT_BADTRAINER, TRAIT_FENCERDEXTERITY, TRAIT_INTELLECTUAL, TRAIT_KHAZUMIA)
	subclass_stats = list(
		STATKEY_CON = 2,
		STATKEY_PER = 3,
		STATKEY_STR = 1,
		STATKEY_WIL = 2
	)
	subclass_skills = list(
		/datum/skill/combat/polearms = SKILL_LEVEL_MASTER,	//This is the danger zone. Ultimately, the class won't be picked without this. I took the liberty of adjusting everything around to make this somewhat inoffensive, but we'll see if it sticks.
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_NOVICE,	//Wrestling is a swordsman's luxury.
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,	//I got told that having zero climbing is a PITA. Bare minimum for a combat class.
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
	)
	adv_stat_ceiling = list(STAT_STRENGTH = 13, STAT_SPEED = 12, STAT_WILLPOWER = 14, STAT_CONSTITUTION = 12)	//Prevent climbing to 14 by picking a +1 STR race.

/datum/outfit/job/roguetown/mercenary/freelancer_lancer/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, span_warning("You put complete trust in your polearm, the most effective weapon the world has seen. Why wear armour when you cannot be hit? You can choose to display the banners of the Khaliphate or of Sohayrah."))
	armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/freifechter
	backl = /obj/item/rogueweapon/scabbard/gwstrap
	var/weapons = list("Graduate's Spear", "Banner of Sohayrah", "Banner of the Khaliphate")
	if(H.mind)
		var/weapon_choice = input(H, "Spear or Pike-Banner?", "As presented to me by Lance-Master Ubaid Javid...") as anything in weapons
		switch(weapon_choice)
			if("Graduate's Spear")		//A steel spear with a cool-looking stick & a banner sticking out of it.
				r_hand = /obj/item/rogueweapon/spear/boar/frei
				l_hand = /obj/item/rogueweapon/katar/punchdagger/frei
			if("Banner of Sohayrah")
				r_hand = /obj/item/rogueweapon/spear/boar/frei/pike
				wrists = /obj/item/rogueweapon/katar/punchdagger/frei
			if("Banner of the Khaliphate")
				r_hand = /obj/item/rogueweapon/spear/boar/frei/pike/reformist
				wrists = /obj/item/rogueweapon/katar/punchdagger/frei

	belt = /obj/item/storage/belt/rogue/leather/battleskirt/black
	beltl = /obj/item/flashlight/flare/torch/lantern
	armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/freifechter
	shirt = /obj/item/clothing/suit/roguetown/shirt/robe/hierophant
	pants = /obj/item/clothing/under/roguetown/trou/leather/eastern
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	gloves = /obj/item/clothing/gloves/roguetown/eastgloves1
	backr = /obj/item/storage/backpack/rogue/satchel/short
	wrists = /obj/item/clothing/neck/roguetown/psicross/khazumia
	head = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/black
	mask = /obj/item/clothing/mask/rogue/lordmask/khazumia

	backpack_contents = list(
		/obj/item/roguekey/mercenary = 1,
		/obj/item/natural/bundle/cloth/bandage/full = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1
		)	
	H.merctype = 6

/datum/advclass/mercenary/freelancer/sabrist
	name = "Khaliphate Mubariz"
	tutorial = "You are a warrior of the Khaliphate, a well-renowned Mubariz - \"Fencer\" - and part of a prestigious lineage of highly-trained warriors localized in the grand city of Sohayrah. It was formed an odd one hundred yils ago, but its visitors come from all parts of the Khaliphate. You have swung one weapon ten-thousand times, and not the other way around. You've left your cradle in search of riches to fund your people's armies- primarily in the ruins of Lyndhardtia."
	extra_context = "This class is for experienced players who have a solid grasp on footwork and stamina management, master skills alone won't save your lyfe. You make up for your inherent weaknesses and limitations with \"master strike\" mechanics."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/mercenary/sabrist
	subclass_languages = list(/datum/language/celestial)
	class_select_category = CLASS_CAT_KHAZUMIA
	category_tags = list(CTAG_MERCENARY)
	cmode_music = 'sound/music/frei_sabre.ogg'
	traits_applied = list(TRAIT_BADTRAINER, TRAIT_INTELLECTUAL, TRAIT_FENCERDEXTERITY, TRAIT_SABRIST, TRAIT_KHAZUMIA)
	subclass_stats = list(
		STATKEY_INT = 2,
		STATKEY_PER = 3,
		STATKEY_SPD = 2
	)
	subclass_skills = list(
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_MASTER,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/sewing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE
	)
	adv_stat_ceiling = list(STAT_STRENGTH = 12, STAT_CONSTITUTION = 10, STAT_WILLPOWER = 12)

/datum/outfit/job/roguetown/mercenary/sabrist/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, span_warning("You are a master in the arts of the sabre. Wielder of a Khaliphate-made sword of excellence, you needn't anything else. Your professionally made sabre facilitates moves from traditional Khazumian fencing treatises."))
	if(H.mind)
		var/armors = list(
		"Fencing Jacket"	= /obj/item/clothing/suit/roguetown/armor/leather/heavy/freifechter,
		"Fencing Cuirass"	= /obj/item/clothing/suit/roguetown/armor/plate/cuirass/fencer
		)
		var/armorchoice = input(H, "Don your armour.", "Security or Flexibility?") as anything in armors
		armor = armors[armorchoice]
	l_hand = /obj/item/rogueweapon/scabbard/sword
	r_hand = /obj/item/rogueweapon/sword/sabre/freifechter
	beltr = /obj/item/rogueweapon/huntingknife/idagger/navaja/freifechter
	belt = /obj/item/storage/belt/rogue/leather/battleskirt/black
	beltl = /obj/item/flashlight/flare/torch/lantern
	shirt = /obj/item/clothing/suit/roguetown/shirt/robe/hierophant
	pants = /obj/item/clothing/under/roguetown/trou/leather/eastern
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	gloves = /obj/item/clothing/gloves/roguetown/eastgloves1
	backr = /obj/item/storage/backpack/rogue/satchel/short
	wrists = /obj/item/clothing/neck/roguetown/psicross/khazumia
	head = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/black
	mask = /obj/item/clothing/mask/rogue/lordmask/khazumia

	backpack_contents = list(
		/obj/item/roguekey/mercenary = 1,
		/obj/item/natural/bundle/cloth/bandage/full = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1
		)	
	H.merctype = 6
