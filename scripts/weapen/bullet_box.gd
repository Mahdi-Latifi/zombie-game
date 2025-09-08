extends Area2D

class_name Bullet_box

var bullet_cap:int
var player

func _on_body_entered(body):
	if body is Player:
		player=body
