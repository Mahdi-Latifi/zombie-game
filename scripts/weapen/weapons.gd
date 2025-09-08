extends Node

class_name weapons

var range_of_weapon
var Reload_Time
var ammo
var Max_ammo
var sound_range
var damage
var Fire_rate
var end_reload_timer=0
var end_shooter_timer=1
var mag
enum WeaponState { Idle, Shooting, Reloading}
var current_state : WeaponState 


@export var Reload_timer: Timer
@export var Fire_rate_timer: Timer 
@export var bullet : PackedScene 
@export var end_of_gun: Marker2D
@export var gun_diraction:Marker2D
@export var animation:AnimatedSprite2D
@export var Pleyer2: CharacterBody2D

func _ready():
	self.position=Vector2(0,0)
func Enter():
	pass

func Update():
	pass
	
func Shoot():
	ammo-=1
	Fire_rate_timer.start()
	current_state=WeaponState.Idle
	end_shooter_timer=0
	make_bullet()
	Fire_sound()
	Fire_rate_timer.start()


func Fire_sound():
	var zombies =get_tree().get_nodes_in_group("s-b-zombie")
	for zombie in zombies:
		var State_machine=zombie.get_node("State_Machine")
		var zombies_idle=State_machine.get_node("Zombie_idle")
		if zombie.position.distance_to(Pleyer2.position) < sound_range:
			zombies_idle.Transitioned.emit(zombies_idle,"V_to_player_command")
		
func change_state(new_state: WeaponState):
	current_state = new_state

func reload():
	mag-=(Max_ammo-ammo)
	if mag<0:
		ammo+=mag
		mag=0
	ammo=Max_ammo
	end_reload_timer=0
	current_state=WeaponState.Idle
		
func idle():
	if Input.is_action_pressed("shoot"):
		if end_shooter_timer and ammo >0:
			print(ammo)
			current_state=WeaponState.Shooting
		elif end_shooter_timer and ammo==0:
			Reload_timer.start()
			current_state=WeaponState.Reloading
		else:
			current_state=WeaponState.Idle
	if Input.is_action_pressed("reload") and mag:
		if ammo!=Max_ammo:
			print("reload")
			Reload_timer.start()
			current_state=WeaponState.Reloading
		else:
			current_state=WeaponState.Idle		

func make_bullet():
	pass
