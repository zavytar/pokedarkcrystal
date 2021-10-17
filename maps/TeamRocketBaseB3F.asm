	object_const_def
	const TEAMROCKETBASEB3F_ARCHER
	const TEAMROCKETBASEB3F_MUSASHI	
	const TEAMROCKETBASEB3F_ROCKET1
	const TEAMROCKETBASEB3F_ROCKET2
	const TEAMROCKETBASEB3F_ROCKET_GIRL
	const TEAMROCKETBASEB3F_SCIENTIST1
	const TEAMROCKETBASEB3F_SCIENTIST2
	const TEAMROCKETBASEB3F_MURKROW
	const TEAMROCKETBASEB3F_STARTER1
	const TEAMROCKETBASEB3F_STARTER2
	const TEAMROCKETBASEB3F_POKE_BALL1
	const TEAMROCKETBASEB3F_POKE_BALL2
	const TEAMROCKETBASEB3F_POKE_BALL3
	const TEAMROCKETBASEB3F_POKE_BALL4
	const TEAMROCKETBASEB3F_POKE_BALL5

TeamRocketBaseB3F_MapScripts:
	def_scene_scripts
	scene_script .IntroScene ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER
	scene_script .DummyScene2 ; SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS
	scene_script .DummyScene3 ; SCENE_TEAMROCKETBASEB3F_NOTHING

	def_callbacks
	callback MAPCALLBACK_TILES, .CheckGiovanniDoor

.IntroScene:
	sdefer IntroSceneScript
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.CheckGiovanniDoor:
	checkevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	iftrue .OpenSesame
	endcallback

.OpenSesame:
	changeblock 10, 8, $07 ; floor
	endcallback

IntroSceneScript:
	opentext
	writetext IntroSceneText
	waitbutton
	closetext
	end

TeamRocketBaseB3F_DefaultCoord:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .RivalBattle
	end

.RivalBattle:
	end

TeamRocketBaseB3F_ArcherScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .GotPokemon 
	faceplayer
	opentext
	writetext TeamRocketBaseB3F_ArcherText1
	waitbutton
	closetext
	end

.GotPokemon:
	faceplayer
	opentext
	writetext TeamRocketBaseB3F_ArcherText2
	waitbutton
	closetext
	end

TeamRocketBaseB3F_MusashiScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .GotPokemon 
	faceplayer
	opentext
	writetext TeamRocketBaseB3F_MusashiText1
	waitbutton
	closetext
	end

.GotPokemon:
	faceplayer
	opentext
	writetext TeamRocketBaseB3F_MusashiText2
	waitbutton
	closetext
	end
	end

TeamRocketBaseB3F_Rocket1Script:
	jumptextfaceplayer TeamRocketBaseB3F_Rocket1Text

TeamRocketBaseB3F_Rocket2Script:
	jumptextfaceplayer TeamRocketBaseB3F_Rocket2Text

TeamRocketBaseB3F_RocketGirlScript:
	jumptextfaceplayer TeamRocketBaseB3F_RocketGirlText

TeamRocketBaseB3F_Scientist1Script:
	jumptextfaceplayer TeamRocketBaseB3F_Scientist1Text

TeamRocketBaseB3F_Scientist2Script:
	jumptextfaceplayer TeamRocketBaseB3F_Scientist2Text

RocketBaseBossLeft:
	applymovement PLAYER, RocketBasePlayerApproachesBossLeftMovement
	sjump RocketBaseBoss

TeamRocketBaseB3F_Murkrow:
	opentext
	writetext TeamRocketBaseB3F_MurkrowText
	waitbutton
	closetext
	end

TeamRocketBaseB3FLockedDoor:
	conditional_event EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE, .Script

.Script:
	opentext
	checkevent EVENT_LEARNED_SLOWPOKETAIL
	iffalse .NeedsPassword
	checkevent EVENT_LEARNED_RATICATE_TAIL
	iffalse .NeedsPassword
	sjump .OpenSesame

.NeedsPassword:
	writetext TeamRocketBaseB3FLockedDoorNeedsPasswordText
	waitbutton
	closetext
	end

.OpenSesame:
	writetext TeamRocketBaseB3FLockedDoorOpenSesameText
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock 10, 8, $07 ; floor
	reloadmappart
	closetext
	setevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	waitsfx
	end

TeamRocketBaseB3FOathScript:
	jumpstd TeamRocketOathScript

TeamRocketBaseB3FProtein:
	itemball PROTEIN

TeamRocketBaseB3FXSpecial:
	itemball X_SPECIAL

TeamRocketBaseB3FFullHeal:
	itemball FULL_HEAL

TeamRocketBaseB3FIceHeal:
	itemball ICE_HEAL

TeamRocketBaseB3FUltraBall:
	itemball ULTRA_BALL

RocketBaseLanceApproachesPlayerMovement:
	step RIGHT
	step_end

RocketBaseLanceLeavesMovement:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

RocketBasePlayerApproachesBossLeftMovement:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	turn_head UP
	step_end

RocketBasePlayerApproachesBossRightMovement:
	step UP
	step UP
	step LEFT
	step UP
	step LEFT
	step LEFT
	turn_head UP
	step_end

RocketBaseBossApproachesPlayerMovement:
	step DOWN
	step_end

RocketBaseBossHitsTableMovement:
	big_step RIGHT
	big_step RIGHT
	step_end

RocketBaseBossLeavesMovement:
	fix_facing
	fast_jump_step LEFT
	remove_fixed_facing
	step_sleep 8
	step_sleep 8
	slow_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

RocketBaseRivalEnterMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBaseRivalLeavesMovement:
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

RocketBaseRivalShovesPlayerMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

IntroSceneText:
	text "ARCHER: Ahem!"

	para "Those passwords"
	line "are known only to"
	cont "a few ROCKETS."
	done

TeamRocketBaseB3F_MurkrowText:
	text "MURKROW: The"
	line "password is…"

	para "HAIL GIOVANNI."
	done

TeamRocketBaseB3F_Rocket1Text:
	text "Hyuck-hyuck-hyuck!"
	
	para "They set up some"
	line "fancy doors in"
	cont "the hideout."

	para "They open with"
	line "passwords!"
	done
	done

TeamRocketBaseB3F_Rocket2Text:
	text "Sigh… I miss"
	line "the old days."

	para "We ROCKETS were"
	line "feared back then…"
	done

TeamRocketBaseB3F_RocketGirlText:
	text "…Yes, GRUNT?"

	para "Aren't you supposed"
	line "to be on a mission"
	cont "right now?"

	para "You don't want to"
	line "make the BOSS mad,"
	cont "do you?"
	done

TeamRocketBaseB3F_Scientist1Text:
	text "Our experiments"
	line "with radio waves"
	cont "are showing great"
	cont "developments!"
	
	para "We are close to"
	line "evolving #MON"
	cont "using the power of"
	cont "our radio signal."
	done

TeamRocketBaseB3F_Scientist2Text:
	text "I used to work for"
	line "SILPH, but now I"
	para "run research for"
	line "TEAM ROCKET."

	para "Now, let me work" 
	line "on my experiment."
	done

TeamRocketBaseB3FLockedDoorNeedsPasswordText:
	text "The door's closed…"

	para "It needs two"
	line "passwords to open."
	done

TeamRocketBaseB3FLockedDoorOpenSesameText:
	text "The door's closed…"

	para "<PLAYER> entered"
	line "the two passwords."

	para "The door opened!"
	done

TeamRocketBaseB3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  2, TEAM_ROCKET_BASE_B2F, 2
	warp_event 27,  2, TEAM_ROCKET_BASE_B2F, 3
	warp_event  3,  6, TEAM_ROCKET_BASE_B2F, 4
	warp_event 27, 14, TEAM_ROCKET_BASE_B2F, 5

	def_coord_events
	coord_event 10,  8, SCENE_TEAMROCKETBASEB3F_DEFAULT, TeamRocketBaseB3F_DefaultCoord

	def_bg_events
	bg_event 10,  9, BGEVENT_IFNOTSET, TeamRocketBaseB3FLockedDoor
	bg_event 11,  9, BGEVENT_IFNOTSET, TeamRocketBaseB3FLockedDoor
	bg_event 10,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event 11,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event 12,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event 13,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  4, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  5, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  6, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  7, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript

	def_object_events
	object_event 25, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeamRocketBaseB3F_ArcherScript, EVENT_TEAM_ROCKET_BASE_POPULATION	; Archer
	object_event  8,  3, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeamRocketBaseB3F_MusashiScript, EVENT_RIVAL_TEAM_ROCKET_BASE_B3F	; Musashi
	object_event 25, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeamRocketBaseB3F_Rocket1Script, EVENT_TEAM_ROCKET_BASE_POPULATION	; Rocket 1
	object_event 25, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeamRocketBaseB3F_Rocket2Script, EVENT_TEAM_ROCKET_BASE_POPULATION	; Rocket 2
	object_event 25, 14, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeamRocketBaseB3F_RocketGirlScript, EVENT_TEAM_ROCKET_BASE_POPULATION	; Rocket Girl
	object_event 25, 14, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeamRocketBaseB3F_Scientist1Script, EVENT_TEAM_ROCKET_BASE_POPULATION	; Scientist 1
	object_event 25, 14, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeamRocketBaseB3F_Scientist2Script, EVENT_TEAM_ROCKET_BASE_POPULATION	; Scientist 2
	object_event  7,  2, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeamRocketBaseB3F_Murkrow, EVENT_TEAM_ROCKET_BASE_POPULATION	; Murkrow
	object_event  9, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeamRocketBaseB3F_KoffingBall, EVENT_GOT_STARTER	; Starter Koffing
	object_event 10, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeamRocketBaseB3F_GrimerBall, EVENT_GOT_STARTER	; Starter Grimer
	object_event  1, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FProtein, EVENT_TEAM_ROCKET_BASE_B3F_PROTEIN	; Protein
	object_event  3, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FXSpecial, EVENT_TEAM_ROCKET_BASE_B3F_X_SPECIAL	; X Special
	object_event 28,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FFullHeal, EVENT_TEAM_ROCKET_BASE_B3F_FULL_HEAL	; Full Heal
	object_event 17,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FIceHeal, EVENT_TEAM_ROCKET_BASE_B3F_ICE_HEAL	; Ice Heal
	object_event 14, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FUltraBall, EVENT_TEAM_ROCKET_BASE_B3F_ULTRA_BALL	; Ultra Ball
