extends state

class_name zombie_movment

@export var Zombie:CharacterBody2D
@onready var Player : CharacterBody2D = get_node("/root/City/Players")

var Fov_Tolerance = 22
var Fov_Distance=200
var Zombie_Speed=100
var first_position

func Move_To_award_Players(Position):
	Zombie.velocity = Zombie.position.direction_to(Position)*Zombie_Speed
	Zombie.move_and_slide()
	Zombie.look_at(Vector2(Position.x,Position.y))

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
	first_position=Zombie.position
	if Player!= null:
		Move_To_award_Players(Player.position)

func Update(delta):
	pass

func Phycics_Update(delta):
	if not Player_is_in_Fov_Telorance():
		Transitioned.emit(self,"Zombie_idle")
	elif Zombie:
		Move_To_award_Players(Player.position)
