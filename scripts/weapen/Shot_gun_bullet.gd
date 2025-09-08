extends Node2D


var bullet_speed=1
var range_of_bullet : int
var Damage:int
var Enemy
var Diraction_gun:Vector2

func Get_diraction_gun(diraction_gun):
	Diraction_gun=diraction_gun

func Fire_Bullet():
	var direction=self.global_position.direction_to(Diraction_gun).normalized()
	var distance=self.global_position.distance_to(Diraction_gun)
	var Rotation_angle=atan2(direction.x,direction.y)
	var Theta_rad=Rotation_angle-deg_to_rad(75)
	var x_point 
	var y_point
	var new_direction_for_each_bullet
	x_point = self.global_position.x+distance* cos(Theta_rad)
	y_point = self.global_position.y-distance* sin(Theta_rad)
	for Child in get_children():
		x_point = self.global_position.x+distance* cos(Theta_rad)
		y_point = self.global_position.y-distance* sin(Theta_rad)
		new_direction_for_each_bullet=(Vector2(x_point,y_point)-self.global_position).normalized()
		Child.Damage=Damage
		Child.range_of_bullet=range_of_bullet
		Child.set_direction(new_direction_for_each_bullet)
		Theta_rad-=deg_to_rad(1)
		
func _process(delta):
	range_of_bullet-=bullet_speed
	if range_of_bullet<=0:
		self.queue_free()

