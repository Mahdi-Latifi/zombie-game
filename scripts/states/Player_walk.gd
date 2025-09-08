extends	state
class_name Player_walk

@export var Players :CharacterBody2D

const Speed=10
const Max_Speed=150
const  Fraction=0.1
var Move : Vector2
var Stamina=0

func Player_movment():
	Stamina=Global.Player_get_stamina()
	if Input.is_action_pressed("up") and not Input.is_action_pressed("down"):
		Move.y=clamp((Move.y-Speed),-Max_Speed,0)
	elif Input.is_action_pressed("down") and not Input.is_action_pressed("up"):
		Move.y=clamp((Move.y+Speed),0,Max_Speed)
	else:
		Move.y=lerp( Move.y,0.0,Fraction)
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		Move.x=clamp((Move.x-Speed),-Max_Speed,0)
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		Move.x=clamp((Move.x+Speed),0,Max_Speed)
	else:
		Move.x=lerp( Move.x,0.0,Fraction)
		
	if(Stamina<100):
		Stamina+=0.5
		Global.Player_set_stamina(Stamina)

func Enter():
	Player_movment()
	Stamina=Global.Player_get_stamina()
	
func Update(delta):
	Player_movment()

func Phycics_Update(delta):
	Players.velocity=Move
	Players.move_and_slide()
	
	if Input.is_action_just_pressed("run"):
		Transitioned.emit(self,"Player_run")
