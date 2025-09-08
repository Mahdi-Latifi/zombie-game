extends "res://scripts/weapen/weapons.gd"

func _ready():
	get_parent().get_parent().connect("Player_Enter",initialaize_Enter_Player)
	range_of_weapon=500
	Reload_Time=2
	Max_ammo=10
	ammo=Max_ammo
	sound_range=1000
	damage=50
	Fire_rate=0.5
	current_state=WeaponState.Idle
	pass 

func Enter():
	Reload_timer.wait_time=Reload_Time
	Fire_rate_timer.wait_time=Fire_rate
	animation.play("colt")

func Update():
	match current_state:
		WeaponState.Idle:
			idle()
		WeaponState.Shooting:
			print("mag",mag)
			Shoot()
		WeaponState.Reloading:
			if end_reload_timer:
				reload()


func make_bullet():
	var bullet_instance=bullet.instantiate()
	bullet_instance.range_of_bullet=range_of_weapon
	bullet_instance.Damage=damage
	bullet_instance.global_position=end_of_gun.global_position
	var direction=end_of_gun.global_position.direction_to(gun_diraction.global_position).normalized()
	bullet_instance.set_direction(direction)
	add_child(bullet_instance)
	
func _on_reload_time_timeout():
	Reload_timer.stop()
	end_reload_timer=1

func _on_fire_rate_timeout():
	Fire_rate_timer.stop()
	end_shooter_timer=1

func initialaize_Enter_Player():
	mag=Global.get_mag()[0]
