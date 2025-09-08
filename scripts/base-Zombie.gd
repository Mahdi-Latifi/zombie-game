extends "res://scripts/Character.gd"

class_name Base_Zombie

var Damage=0
var Zombie_Speed=100
var first_position=self.position
var player_in_tolarance=false
var health=100


@onready var Player = get_node("/root/City/Players")

func _ready():
	set_damage(10)
	$Health_bar.value=health
	first_position=self.position
	pass
	
func _process(delta):
	$Health_bar.value=health
	if health<=0:
		print("dead zombie")
		self.queue_free()
#	Player_is_in_Fov_Telorance()

func set_damage(d):
	Damage=d	
	
func _on_zombie_hit_box_body_entered(body):
		if body is Player:
			look_at(Player.global_position)
