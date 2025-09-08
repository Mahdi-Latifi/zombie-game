extends Node

var Player_get_damage
var health
var Stamina
var fov_distance=200
var Player_path
var City_path
var mag

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
 
func Player_get_damage_set(s):
	Player_get_damage=s
func Player_get_damage_get():
	return Player_get_damage
	
func Player_health_set(h):
	health=h
func Player_health_get():
	return health
	
func Player_set_stamina(stamina):
	Stamina=stamina
func Player_get_stamina():
	return Stamina

func Zombie_get_fov_distance():
	return fov_distance	
func Zombie_set_fov_distance(Fov_distance):
	fov_distance=Fov_distance
	
func set_Player_Save_path_ (path):
	Player_path=path
func get_Player_Save_path_ ():
	return Player_path
	
func set_City_Save_path_ (path):
	City_path=path
func get_City_Save_path_ ():
	return City_path
	
func set_mag(data):
	mag=data
func get_mag():
	return mag
	
	
