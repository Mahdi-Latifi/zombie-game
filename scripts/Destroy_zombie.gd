extends "res://scripts/base-Zombie.gd"
class_name Destroy_Zombie
var Zombie_got_destroy=false
var in_body_heat_box=false
var check=1
var Fov_Tolerance = 22
var Fov_Distance=200

func _ready():
	health=200
	$Health_bar.value=health
	Damage=0

func _process(delta):
	$Health_bar.value=health
	Player_is_in_Fov_Telorance()
	damage_and_destroy()
	if health<=0:
		print("dead zombie")
		self.queue_free()
	
func Player_is_in_Fov_Telorance():
	if Player!=null:
		var NPC_Facing_diraction=Vector2(1,0).rotated(global_rotation)
		var direction_to_player = (Player.global_position- global_position).normalized()
		var Player_distance=Player.position- global_position	
		if abs(direction_to_player.angle_to(NPC_Facing_diraction))< deg_to_rad(Fov_Tolerance) and  Player_distance.length()<Fov_Distance:
			player_in_tolarance=true
		else:
			player_in_tolarance=false
 
func damage_and_destroy():
	if player_in_tolarance and in_body_heat_box:
		if  not Zombie_got_destroy:
			if check:
				$attack_cooldown.wait_time=2
				$attack_cooldown.start()
				check=0			
	

func _on_zombie_box_body_entered(body):
	if body is Player:
		in_body_heat_box=true	
		
func _on_zombie_hit_box_body_exited(body):
	if body is Player:
		in_body_heat_box=false
	
func _on_attack_cooldown_timeout():
	if Zombie_got_destroy:
		self.queue_free()
		Zombie_got_destroy=false
	else:	
		$attack_cooldown.wait_time=1
		Zombie_got_destroy=true
		set_damage(50)
		$attack_cooldown.start()

