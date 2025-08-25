/datum/advclass/mercenary/desert_rider
	name = "Desert Rider"
	tutorial = "Blood, like the desert sand, stains your hands, a crimson testament to the gold you covet. A desert rider, renowned mercenary of the far east, your shamshir whispers tales of centuries-old tradition. Your loyalty, a fleeting mirage in the shifting sands, will yield to the allure of fortune."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
	outfit = /datum/outfit/job/roguetown/mercenary/desert_rider
	traits_applied = list(TRAIT_OUTLANDER)
	category_tags = list(CTAG_MERCENARY)
	cmode_music = 'sound/music/combat_desertrider.ogg' //GREATEST COMBAT TRACK IN THE GAME SO FAR BESIDES MAYBE MANIAC2.OGG
	classes = list("Jannisary" = "The Janissaries are the Empire's elite infantry units, wielding sword and shield. We do not break.",
					"Zeybek" = "Zybantu 'Blade Dancers' famed and feared the world over. Their expertise in blades both long and short is well known.")


/datum/outfit/job/roguetown/mercenary/desert_rider/pre_equip(mob/living/carbon/human/H)
	..()

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Janissary","Zeybek")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)
		if("Janissary")
			H.set_blindness(0)
			to_chat(H, span_warning("The Janissaries are the Ziggurat's elite infantry units, wielding sword and shield. We do not break."))
			H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
			H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
			H.change_stat("strength", 2)
			H.change_stat("endurance", 3)
			H.change_stat("constitution", 1)
			backl = /obj/item/rogueweapon/shield/tower/zybantu
			r_hand = /obj/item/rogueweapon/sword/sabre/shamshir
			head = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/zybantu
			mask = /obj/item/clothing/mask/rogue/facemask/hound
			neck = /obj/item/clothing/neck/roguetown/gorget
			cloak = /obj/item/clothing/cloak/half/rider/red
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/red
			armor = /obj/item/clothing/suit/roguetown/armor/plate/scale
			wrists = /obj/item/clothing/wrists/roguetown/bracers
			gloves = /obj/item/clothing/gloves/roguetown/leather
			pants = /obj/item/clothing/under/roguetown/chainlegs
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
			belt = /obj/item/storage/belt/rogue/leather/shalal
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			beltr = /obj/item/rogueweapon/scabbard/sword
			backr = /obj/item/storage/backpack/rogue/satchel/short
			backpack_contents = list(
				/obj/item/roguekey/mercenary,
				/obj/item/rogueweapon/huntingknife/idagger/navaja,
				/obj/item/clothing/neck/roguetown/shalal,
				/obj/item/flashlight/flare/torch,
				/obj/item/rogueweapon/scabbard/sheath,
				/obj/item/storage/belt/rogue/pouch/coins/poor
				)

		if("Zeybek")
			H.set_blindness(0)
			to_chat(H, span_warning("Zybantine 'Blade Dancers' are famed and feared the world over. Their expertise in blades both long and short is well known."))
			H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE) 
			H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
			H.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
			H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
			H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
			H.change_stat("endurance", 2)
			H.change_stat("intelligence", 1)
			H.change_stat("perception", 1)
			H.change_stat("speed", 3)
			head = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/zybantu
			neck = /obj/item/clothing/neck/roguetown/leather
			mask = /obj/item/clothing/mask/rogue/facemask/steel/hound
			cloak = /obj/item/clothing/cloak/half/rider/red
			armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat/zybantu
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/zybantu
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
			gloves = /obj/item/clothing/gloves/roguetown/leather
			belt = /obj/item/storage/belt/rogue/leather/shalal
			beltl = /obj/item/rogueweapon/scabbard/sword
			pants = /obj/item/clothing/under/roguetown/trou/leather/pontifex/zybantu
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
			backr = /obj/item/storage/backpack/rogue/satchel/short
			backpack_contents = list(
				/obj/item/roguekey/mercenary,
				/obj/item/rogueweapon/huntingknife/idagger/navaja,
				/obj/item/rogueweapon/scabbard/sheath,
				/obj/item/clothing/neck/roguetown/shalal,
				/obj/item/flashlight/flare/torch,
				/obj/item/storage/belt/rogue/pouch/coins/poor
				)

			var/weapons = list("Shamshir and Javelin","Whips and Knives", "Recurve Bow")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			H.set_blindness(0)
			switch(weapon_choice)
				if("Shamshir and Javelin")
					H.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
					r_hand = /obj/item/rogueweapon/sword/sabre/shamshir
					backl = /obj/item/quiver/javelin/iron
				if("Whips and Knives")	///They DO enslave people after all
					H.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
					H.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
					r_hand = /obj/item/rogueweapon/whip
					l_hand = /obj/item/rogueweapon/huntingknife/idagger/steel/parrying
					backl = /obj/item/rogueweapon/scabbard/sheath
				if("Recurve Bow")
					H.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
					r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
					backl = /obj/item/quiver/arrows
	H.grant_language(/datum/language/zybanti)
