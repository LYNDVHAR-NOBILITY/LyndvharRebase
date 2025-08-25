/datum/advclass/mercenary/forlorn
	name = "Forvheipal Thrall"
	tutorial = "A thrall-warrior from the strange and enigmatic kingdom in Yoheon, Forvheipal. The thralls are a sellsword contingent of the Zapyrixian Order- mostly made up of Lupians and Vulpkian slaves-from-birth. They will do any work for the highest bidder as per their contract made from birth- and thus you will, too."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
	outfit = /datum/outfit/job/roguetown/mercenary/forlorn
	min_pq = 2
	cmode_music = 'sound/music/combat_blackstar.ogg'
	traits_applied = list(TRAIT_OUTLANDER)
	category_tags = list(CTAG_MERCENARY)

/datum/outfit/job/roguetown/mercenary/forlorn/pre_equip(mob/living/carbon/human/H)
	..()

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Light Infantry","Javelineer")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)
		if("Light Infantry")
			H.set_blindness(0)
			to_chat(H, span_warning("The Light Infantry are the Zapyrixian Order's regular thralls, wielding warhammer and shield."))
			H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
			H.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
			H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
			H.change_stat("strength", 2)
			H.change_stat("endurance", 2)
			H.change_stat("perception", 1)
			H.change_stat("constitution", 2)
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
			neck = /obj/item/clothing/neck/roguetown/gorget/forlorncollar
			mask = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/gallant
			pants = /obj/item/clothing/under/roguetown/splintlegs
			gloves = /obj/item/clothing/gloves/roguetown/angle/atgervi
			belt = /obj/item/storage/belt/rogue/leather/steel/tasset
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light
			wrists = /obj/item/clothing/wrists/roguetown/splintarms
			armor = /obj/item/clothing/suit/roguetown/armor/brigandine/light
			beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
			beltl = /obj/item/rogueweapon/mace/warhammer/steel
			backr = /obj/item/storage/backpack/rogue/satchel/short
			backl = /obj/item/rogueweapon/shield/heater
			backpack_contents = list(/obj/item/rogueweapon/huntingknife, /obj/item/roguekey/mercenary, /obj/item/rogueweapon/scabbard/sheath)

			var/helms = list("Barred Helmet", "Volfplate Helmet")
			var/helms_choice = input(H,"Choose your helmet.", "TAKE UP HELMS") as anything in helms
			switch(helms_choice)
				if("Barred Helmet")
					H.equip_to_slot_or_del(new /obj/item/clothing/head/roguetown/helmet/heavy/sheriff, SLOT_HEAD, TRUE)
				if("Volfplate Helmet")
					H.equip_to_slot_or_del(new /obj/item/clothing/head/roguetown/helmet/heavy/volfplate, SLOT_HEAD, TRUE)

		if("Javelineer")
			H.set_blindness(0)
			to_chat(H, span_warning("The Forvheipal Javelineers are the Zapyrixian Order's ranged thrall, wielding javelins and relying on their agility to avoid blows."))
			H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
			H.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
			H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
			H.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
			H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
			H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/tracking, 3, TRUE)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
			H.change_stat("strength", -1)
			H.change_stat("intelligence", 1)
			H.change_stat("perception", 3)
			H.change_stat("speed", 2)
			H.change_stat("endurance", 2)
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
			neck = /obj/item/clothing/neck/roguetown/gorget/forlorncollar
			head = /obj/item/clothing/head/roguetown/helmet/heavy/volfplate
			pants = /obj/item/clothing/under/roguetown/splintlegs
			gloves = /obj/item/clothing/gloves/roguetown/leather
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
			belt = /obj/item/storage/belt/rogue/leather
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
			armor = /obj/item/clothing/suit/roguetown/armor/brigandine/light
			l_hand = /obj/item/rogueweapon/sword/short/messer
			beltl = /obj/item/rogueweapon/scabbard/sword
			beltr = /obj/item/quiver/javelin/steel
			backr = /obj/item/storage/backpack/rogue/satchel/short
			backl = /obj/item/quiver/javelin/steel
			backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel, /obj/item/roguekey/mercenary, /obj/item/rogueweapon/scabbard/sheath, /obj/item/storage/belt/rogue/pouch/coins/poor)

			var/helmets = list("Hound Mask", "Volfplate Helmet")
			var/helmets_choice = input(H,"Choose your helmet.", "TAKE UP HELMS") as anything in helmets
			switch(helmets_choice)
				if("Hound Mask")
					H.equip_to_slot_or_del(new /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/gallant, SLOT_HEAD, TRUE)
					H.equip_to_slot_or_del(new /obj/item/clothing/mask/rogue/facemask/steel/hound, SLOT_WEAR_MASK, TRUE)
				if("Volfplate Helmet")
					H.equip_to_slot_or_del(new /obj/item/clothing/head/roguetown/helmet/heavy/volfplate, SLOT_HEAD, TRUE)
					H.equip_to_slot_or_del(new /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/gallant, SLOT_WEAR_MASK, TRUE)
	H.grant_language(/datum/language/forvheipan)
