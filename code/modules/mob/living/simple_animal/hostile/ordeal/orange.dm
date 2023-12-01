

/mob/living/simple_animal/hostile/ordeal/orange_dusk
	desc = "A shrimp that is equiped with specialized gear."
	icon = 'ModularTegustation/Teguicons/32x32.dmi'
	faction = list("shrimp","orange_ordeal")
	health = 1000
	maxHealth = 1000
	melee_damage_type = RED_DAMAGE
	melee_damage_lower = 14
	melee_damage_upper = 18
	robust_searching = TRUE
	stat_attack = HARD_CRIT
	del_on_death = TRUE
	attack_verb_continuous = "punches"
	attack_verb_simple = "punches"
	attack_sound = 'sound/weapons/bite.ogg'
	speak_emote = list("burbles")
	can_patrol = TRUE

/mob/living/simple_animal/hostile/ordeal/orange_dusk/red
	name = "red minigunner"
	desc = "A shrimp that is equiped with specialized gear."
	icon_state = "wellcheers_bad"
	icon_living = "wellcheers_bad"
	melee_damage_type = RED_DAMAGE
	damage_coeff = list(RED_DAMAGE = 0.2, WHITE_DAMAGE = 0.8, BLACK_DAMAGE = 1.5, PALE_DAMAGE = 1)
	ranged = 5
	rapid = 20
	rapid_fire_delay = 0.4
	move_to_delay = 5
	retreat_distance = 2
	minimum_distance = 3
	casingtype = /obj/item/ammo_casing/caseless/red_minigun
	projectilesound = 'sound/weapons/gun/pistol/shot_alt.ogg'
	var/shooting = FALSE

/mob/living/simple_animal/hostile/ordeal/orange_dusk/red/Move()
	if(shooting)
		return FALSE
	return ..()

/mob/living/simple_animal/hostile/ordeal/orange_dusk/red/Goto(target, delay, minimum_distance)
	if(shooting)
		return FALSE
	return ..()

/mob/living/simple_animal/hostile/ordeal/orange_dusk/red/DestroySurroundings()
	if(shooting)
		return FALSE
	return ..()

/mob/living/simple_animal/hostile/ordeal/orange_dusk/red/OpenFire(atom/A)
	shooting = TRUE
	return ..()

/mob/living/simple_animal/hostile/ordeal/orange_dusk/red/Initialize()
	. = ..()
	color = COLOR_RED

/mob/living/simple_animal/hostile/ordeal/orange_dusk/red/Life()
	. = ..()
	if(shooting)
		SLEEP_CHECK_DEATH(0.4)
		shooting = FALSE

/mob/living/simple_animal/hostile/ordeal/orange_dusk/white
	name = "white sniper"
	icon_state = "wellcheers_bad"
	icon_living = "wellcheers_bad"
	melee_damage_type = WHITE_DAMAGE
	damage_coeff = list(RED_DAMAGE = 1, WHITE_DAMAGE = 0.2, BLACK_DAMAGE = 0.8, PALE_DAMAGE = 1.5)
	ranged = 2.5
	move_to_delay = 5
	vision_range = 27 //three screens away
	retreat_distance = 8
	minimum_distance = 3
	casingtype = /obj/item/ammo_casing/caseless/white_sniper
	projectilesound = 'sound/weapons/gun/pistol/shot_alt.ogg'

/mob/living/simple_animal/hostile/ordeal/orange_dusk/white/Initialize()
	. = ..()
	color = COLOR_WHITE

/mob/living/simple_animal/hostile/ordeal/orange_dusk/black
	name = "black shanker"
	icon_state = "wellcheers_bad"
	icon_living = "wellcheers_bad"
	melee_damage_type = BLACK_DAMAGE
	damage_coeff = list(RED_DAMAGE = 1.5, WHITE_DAMAGE = 1, BLACK_DAMAGE = 0.2, PALE_DAMAGE = 0.8)
	rapid_melee = 4
	move_to_delay = 2.4
	melee_damage_lower = 10
	melee_damage_upper = 12
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slashes"
	var/fast_mode = FALSE

/mob/living/simple_animal/hostile/ordeal/orange_dusk/black/Initialize()
	. = ..()
	color = COLOR_PURPLE

// Modified patrolling
/mob/living/simple_animal/hostile/ordeal/orange_dusk/black/patrol_select()
	fast_mode = TRUE
	var/list/target_turfs = list()
	for(var/mob/living/carbon/human/H in GLOB.human_list)
		if(H.z != z) // Not on our level
			continue
		if(get_dist(src, H) < 4 || H.stat != DEAD)
			continue
		target_turfs += get_turf(H)

	var/turf/target_turf = get_closest_atom(/turf/open, target_turfs, src)
	if(istype(target_turf))
		patrol_path = get_path_to(src, target_turf, /turf/proc/Distance_cardinal, 0, 200)
		return
	return ..()

/mob/living/simple_animal/hostile/ordeal/orange_dusk/black/MoveToTarget(list/possible_targets)
	if(get_dist(src, target) >= 3)
		fast_mode = TRUE
	if(get_dist(src, target) <= 1)
		fast_mode = FALSE
	return ..()

/mob/living/simple_animal/hostile/ordeal/orange_dusk/black/Life()
	. = ..()
	if(fast_mode)
		move_to_delay = 0.6//fast as fuck boi!
	if(!fast_mode)
		move_to_delay = 2.4

/mob/living/simple_animal/hostile/ordeal/orange_dusk/pale
	name = "pale shotgunner"
	icon_state = "wellcheers_bad"
	icon_living = "wellcheers_bad"
	melee_damage_type = PALE_DAMAGE
	melee_damage_lower = 8
	melee_damage_upper = 12
	damage_coeff = list(RED_DAMAGE = 0.8, WHITE_DAMAGE = 1.5, BLACK_DAMAGE = 1, PALE_DAMAGE = 0.2)
	ranged = 1
	retreat_distance = 2
	minimum_distance = 3
	casingtype = /obj/item/ammo_casing/caseless/pale_shotgun
	projectilesound = 'sound/weapons/gun/pistol/shot_alt.ogg'

/mob/living/simple_animal/hostile/ordeal/orange_dusk/pale/Initialize()
	. = ..()
	color = COLOR_CYAN
