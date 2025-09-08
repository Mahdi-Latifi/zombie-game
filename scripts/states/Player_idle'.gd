extends state
class_name Player_idle

@export var enemy
const Speed=10
const Max_Speed=150
const  Fraction=0.1
var Move : Vector2

func Player_movment():
			if Input.is_action_pressed("up") and not Input.is_action_pressed("down"):
				velocity.y=clamp((velocity.y-Speed),-Max_Speed,0)
			elif Input.is_action_pressed("down") and not Input.is_action_pressed("up"):
				velocity.y=clamp((velocity.y+Speed),0,Max_Speed)
			else:
				velocity.y=lerp( velocity.y,0.0,Fraction)
			if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
				velocity.x=clamp((velocity.x-Speed),-Max_Speed,0)
			elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
				velocity.x=clamp((velocity.x+Speed),0,Max_Speed)
			else:
				velocity.x=lerp( velocity.x,0.0,Fraction)
