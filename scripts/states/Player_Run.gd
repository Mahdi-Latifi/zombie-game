extends state

class_name Player_run

@export var Players :CharacterBody2D


var Speed_run=300
var Stamina=0

var Move:Vector2

func Player_movment_run():
	
	if Input.is_action_pressed("up") and not Input.is_action_pressed("down"):
		Move.y=-Speed_run
	elif Input.is_action_pressed("down") and not Input.is_action_pressed("up"):
		Move.y=Speed_run
	else:
		Move.y=0
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		Move.x=-Speed_run
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		Move.x=Speed_run
	else:
		Move.x=0
	Stamina-=1

func Enter():
	Player_movment_run()
	Stamina=Global.Player_get_stamina()
	
func Update(delta):
	Player_movment_run()
	Global.Player_set_stamina(Stamina)
	
func Phycics_Update(delta):
	Players.velocity=Move
	Players.move_and_slide()
	if not Input.is_action_pressed("run") or  Stamina<=0:
		Transitioned.emit(self,"Player_walk")
