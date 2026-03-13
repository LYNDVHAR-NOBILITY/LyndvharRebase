/obj/effect/proc_holder/spell/self/conjure_armor/crystalhide
	name = "Conjure Crystalline Cover"
	desc = "Conjure a protective layer of crystals in place of armor. The close proximity to such pure and mesmerizing structures seems to subtly refocus the mind, allowing one to greater wield their intellect. Though such a thing might cause a headache for others in close proximity when it is dispelled by the user or an opponent."
	overlay_state = "conjure_dragonhide"
	sound = list('sound/magic/whiteflame.ogg')

	releasedrain = 50
	chargedrain = 1
	chargetime = 5 SECONDS
	no_early_release = TRUE
	recharge_time = 5 MINUTES

	warnie = "spellwarning"
	antimagic_allowed = FALSE
	charging_slowdown = 3
	cost = 4
	spell_tier = 3

	invocations = list("Crystallinum Claritas") //I hate whoever wrote everythign in this dm originally. This should be something stupid like "crystalline clarity" but it's stupid trash translate cause 15000 grammar rules for writing in latin lol
	invocation_type = "shout"
	glow_color = GLOW_COLOR_ARCANE
	glow_intensity = GLOW_INTENSITY_MEDIUM

	objtoequip = /obj/item/clothing/suit/roguetown/crystalhide
	slottoequip = SLOT_ARMOR
	checkspot = "armor"
	cooldown_on_dissipate = TRUE
	summondelay = 7 SECONDS //Cast This In Combat, I Dare You.

/obj/item/clothing/suit/roguetown/crystalhide
	name = "crystalhide"
	desc = "A shell of mesmerizing arcyne crystals. Their close proximity causes your mind to refocus."
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	icon = 'icons/mob/actions/roguespells.dmi'
	icon_state = "conjure_dragonhide"
	slot_flags = ITEM_SLOT_ARMOR
	mob_overlay_icon = null
	sleeved = null
	boobed = FALSE
	flags_inv = null
	armor_class = ARMOR_CLASS_LIGHT
	blade_dulling = DULLING_BASHCHOP
	blocksound = PLATEHIT
	armor = ARMOR_LEATHER_GOOD
	max_integrity = ARMOR_INT_CHEST_LIGHT_BASE
	body_parts_covered = COVERAGE_ALL_BUT_HANDFEET | COVERAGE_HEAD_NOSE | NECK | HANDS | FEET
	unenchantable = TRUE
	var/obj/effect/proc_holder/spell/self/conjure_armor/linked_conjure_spell

/obj/item/clothing/suit/roguetown/crystalhide/equipped(mob/living/user)
	. = ..()
	if(!QDELETED(src))
		user.apply_status_effect(/datum/status_effect/buff/crystalhide)

/obj/item/clothing/suit/roguetown/crystalhide/proc/blast_back(mob/living/wearer)
	if(!wearer)
		return
	for(var/mob/living/target in oview(1, wearer))
		var/throwtarget = get_edge_target_turf(wearer, get_dir(wearer, get_step_away(target, wearer)))
		target.safe_throw_at(throwtarget, 2, 1, wearer, spin = FALSE, force = MOVE_FORCE_EXTREMELY_STRONG)
		target.adjustBruteLoss(20) //bonus. doesnt rly matter

/obj/item/clothing/suit/roguetown/crystalhide/proc/dispel()
	if(QDELETED(src))
		return
	var/mob/living/wearer = istype(loc, /mob/living) ? loc : null
	if(wearer)
		wearer.remove_status_effect(/datum/status_effect/buff/crystalhide)
	src.visible_message(span_warning("The [src] fractures into a violent crystal burst!"))
	if(linked_conjure_spell)
		linked_conjure_spell.start_delayed_recharge()
	blast_back(wearer)
	qdel(src)

/obj/item/clothing/suit/roguetown/crystalhide/obj_break()
	. = ..()
	if(!QDELETED(src))
		dispel()

/obj/item/clothing/suit/roguetown/crystalhide/attack_hand(mob/living/user)
	. = ..()
	if(!QDELETED(src))
		dispel()

/obj/item/clothing/suit/roguetown/crystalhide/dropped(mob/living/user)
	. = ..()
	user.remove_status_effect(/datum/status_effect/buff/crystalhide)
	if(!QDELETED(src))
		dispel()


#define CRYSTALHIDE_FILTER "crystalhide_glow"

/datum/status_effect/buff/crystalhide
	id = "crystalhide"
	alert_type = /atom/movable/screen/alert/status_effect/buff/crystalhide
	duration = -1
	effectedstats = list(STATKEY_INT = 1)
	examine_text = "<font color='cyan'>SUBJECTPRONOUN glimmers with brittle and eye-catching arcyne crystals.</font>"
	var/outline_colour = "#3aa8ff"

/atom/movable/screen/alert/status_effect/buff/crystalhide
	name = "Crystalhide focus"
	desc = "The crystal clear focus I have when adorned in this armor is fascinating!"

/datum/status_effect/buff/crystalhide/on_apply()
	. = ..()
	var/filter = owner.get_filter(CRYSTALHIDE_FILTER)
	if(!filter)
		owner.add_filter(CRYSTALHIDE_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 40, "size" = 1))

/datum/status_effect/buff/crystalhide/on_remove()
	. = ..()
	owner.remove_filter(CRYSTALHIDE_FILTER)

#undef CRYSTALHIDE_FILTER
