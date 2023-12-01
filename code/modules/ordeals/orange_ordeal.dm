// Dusk
/datum/ordeal/orange_dusk
	name = "Dusk of Orange"
	annonce_text = "We hired these men to take back what's rightfuly ours."
	annonce_sound = 'sound/effects/ordeals/indigo_start.ogg'
	end_sound = 'sound/effects/ordeals/indigo_end.ogg'
	level = 3
	reward_percent = 0.20
	color = "#FF8C00"
	var/list/potential_types = list(
		/mob/living/simple_animal/hostile/ordeal/orange_dusk/pale,
		/mob/living/simple_animal/hostile/ordeal/orange_dusk/red,
		/mob/living/simple_animal/hostile/ordeal/orange_dusk/black,
		/mob/living/simple_animal/hostile/ordeal/orange_dusk/white
		)

/datum/ordeal/orange_dusk/Run()
	..()
	var/list/available_locs = GLOB.xeno_spawn.Copy()
	for(var/i = 1 to 4)
		if(!potential_types.len)
			break
		var/turf/T = pick(available_locs)
		if(available_locs.len > 1)
			available_locs -= T
		var/chosen_type = pick(potential_types)
		potential_types -= chosen_type
		var/mob/living/simple_animal/hostile/ordeal/C = new chosen_type(T)
		ordeal_mobs += C
		C.ordeal_reference = src

// Midnight
/datum/ordeal/boss/orange_midnight
	name = "Midnight of Orange"
	annonce_text = "Shrimpy a diffence in krill."
	annonce_sound = 'sound/effects/ordeals/indigo_start.ogg'
	end_sound = 'sound/effects/ordeals/indigo_end.ogg'
	level = 4
	reward_percent = 0.25
	color = "#3F00FF"
	//bosstype = /mob/living/simple_animal/hostile/ordeal/indigo_midnight
	bosstype = /mob/living/simple_animal/hostile/distortion/shrimp_rambo
