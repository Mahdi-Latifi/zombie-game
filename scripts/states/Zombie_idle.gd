extends state

class_name Zombie_idle

@export var Zombie:CharacterBody2D
@onready var Player = get_node("/root/City/Players")

var Fov_Tolerance = 22
var Fov_Distance=200
var Zombie_Speed=100
var Move_diraction:Vector2
var Wonder_time:float

func randomize_wander():
	Move_diraction=Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()
	Wonder_time =randf_range(1,3)

func Player_is_in_Fov_Telorance():
	if Player!=null:
		var NPC_Facing_diraction=Vector2(1,0).rotated(Zombie.global_rotation)
		var direction_to_player = (Player.global_position- Zombie.global_position).normalized()
		var Player_distance=Player.position- Zombie.global_position	
		if abs(direction_to_player.angle_to(NPC_Facing_diraction))< deg_to_rad(Fov_Tolerance) and  Player_distance.length()<Fov_Distance:
			return true
		else:
			return false

func Enter():
	randomize_wander()
	
func Update(delta):
	if Wonder_time>0:
		Wonder_time -=delta
	else:
		randomize_wander()
	
func Phycics_Update(delta):
	if Zombie:
		Zombie.velocity = Move_diraction*Zombie_Speed
		Zombie.look_at(Move_diraction*-1)
		Zombie.move_and_slide()
	if Player_is_in_Fov_Telorance():
		Transitioned.emit(self,"zombie_movment")
