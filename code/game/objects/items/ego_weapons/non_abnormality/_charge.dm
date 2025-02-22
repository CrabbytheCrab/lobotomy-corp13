/obj/item/ego_weapon/city/charge
	var/release_message = "You release your charge!"
	var/charge_effect = "spend charge."
	var/charge_cost = 1
	var/charge
	var/activated

/obj/item/ego_weapon/city/charge/examine(mob/user)
	. = ..()
	. += "Spend [charge]/[charge_cost] charge to [charge_effect]"

/obj/item/ego_weapon/city/charge/attack(mob/living/target, mob/living/user)
	..()
	if(charge<20 && target.stat != DEAD)
		charge+=1

/obj/item/ego_weapon/city/charge/proc/release_charge(mob/living/target, mob/living/user)
	if(!CanUseEgo(user))
		return
	charge -= charge_cost
	charge = round(max(charge, 0), 1)
	to_chat(user, "<span class='notice'>[release_message].</span>")
