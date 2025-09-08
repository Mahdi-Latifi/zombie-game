extends Area2D

class_name Bullet

var bullet_speed=10
var range_of_bullet : int
var Damage:int
var Enemy
var direction : Vector2

func _process(delta):
	pass
	
func _physics_process(delta):

	Bullet_Movment()
	
func Bullet_Movment():
	var velocity=direction*bullet_speed
	range_of_bullet-=bullet_speed
	self.global_position+=velocity
	if range_of_bullet <= 0:
		queue_free()

func set_direction(direction1:Vector2):
	self.direction=direction1


func _on_body_entered(body):
	if body is Base_Zombie :
		Enemy=body
		Enemy.health-=Damage
		print("health:",Enemy.health)
		self.queue_free()
	if	body is Destroy_Zombie:
		Enemy=body
		Enemy.health-=Damage
		print("health:",Enemy.health)
		self.queue_free()
	pass # Replace with function body.
