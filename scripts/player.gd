extends "res://scripts/Character.gd"

class_name Player


var Player_in_Attack_range=false
var enemy_attack_on_cooldown=false
var Enemy=Node2D
var health=Base_Health
var is_Player_alive=true
var Stamina=100
var get_damage=0
var Mag=[]

signal Player_Enter

func _ready():
	Load_game()
	emit_signal("Player_Enter")
	pass
#func _process(delta):
	


func _physics_process(delta):
	#Movement_of_Player()
	look_at(get_global_mouse_position())
	enemy_attack()
	if health<=0:
		is_Player_alive=false
		health=0
		print("You died")
		self.queue_free()
		
func _on_player_hit_box_area_entered(area):
	Enemy=area.get_parent()
	if Enemy is Base_Zombie:
		Player_in_Attack_range= true

func _on_player_hit_box_area_exited(area):
	Enemy=area.get_parent()
	if Enemy is Base_Zombie:
		Player_in_Attack_range= false


func enemy_attack():
	if Player_in_Attack_range and !enemy_attack_on_cooldown:
		enemy_attack_on_cooldown=true
		health -= Enemy.Damage
		Global.Player_health_set(health)
		$attack_cooldown.start()
		
func Load_game():
	var path=Global.get_Player_Save_path_()
	if not FileAccess.file_exists(path):
		return
	var save_game = FileAccess.open(path, FileAccess.READ)
	var Save_Data=save_game.get_var(true)
	health=Save_Data["HP"]
	Mag=Global.set_mag(Save_Data["Mag"])
	Global.Player_health_set(health)
	Global.Player_set_stamina(Stamina)
	save_game.close()
	
	

func _on_attack_cooldown_timeout():
	enemy_attack_on_cooldown=false





