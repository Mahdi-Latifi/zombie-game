extends Node2D

@onready var point1=$CharacterBody2D
@onready var point2=$CharacterBody2D2

func _process(delta: float) -> void:
	var direction = (point1.position- point2.position).normalized()
	var distance=point1.position.distance_to(point2.position)
	var rotation_angle = atan2(direction.y, direction.x)
	var theta_rad = deg_to_rad(45)
	var x_point = point1.position.x + distance * cos(theta_rad)
	var y_point = point1.position.y + distance * sin(theta_rad)
	point2.position=Vector2(x_point,y_point)
