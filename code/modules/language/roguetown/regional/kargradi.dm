/datum/language/kargradi
	name = "Kargradi"
	desc = "The language spoken between those who live near the border of Khazumia and Southern Zybantium, abundant within the Potentate Guild and often used by the Kargradi, the locale of the region. The tribes that settled in this region for centuries have been perfecting their uniquely complex tongue, foreigners find it incredibly difficult to pick the language up - let alone master it."
	speech_verb = "enounces"
	whisper_verb = "whispers"
	exclaim_verb = "remarks"
	key = "a"
	flags = LANGUAGE_HIDE_ICON_IF_UNDERSTOOD | LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD
	space_chance = 20
	default_priority = 90
	icon_state = "asse"
	spans = list(SPAN_KARGRADI)
	syllables = list(
	"ál", "by", "č", "ch", "če", "do", "en", "ho", "je", "ko", "la", "le", "na", "ne", "ní", "od", "ou", "ov", "po", "pr", "ra", "ro", "se", "st", "te", "to", "je", "by", "ko", "ho", "do",
	"ach", "ako", "ale", "byl", "chi", "děl", "ení", "jak", "kdy", "kte", "měl", "nos", "ost", "ova", "pod", "pře", "pří", "pro", "sem", "sta", "tak", "ter", "val", "ylo", "šti", "ša",
	"an", "ał", "ch", "cz", "dz", "rz", "zy", "zi", "za", "ze", "wi", "wy",
	"był", "cze", "czy", "dzi", "iał", "ied", "iej", "kie", "prz", "rze", "rzy", "ści", "się", "wie", "ych", "zie",
	"ár", "ás", "ég", "ek", "gy", "ha", "ány", "ász", "ató", "ész", "gye", "nak", "nek", "zet", )

// Common Czech & Polish syllables, will mix together in-game. Sourced from https://www.sttmedia.com, with added syllables and tweaks as necessary to make the language flow better.
// Common Hungarian/Magyar syllables added.
