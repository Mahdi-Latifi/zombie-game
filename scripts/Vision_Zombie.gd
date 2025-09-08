extends "res://scripts/base-Zombie.gd"

func draw_circle_arc_poly(center, radius, angle_from, angle_to, color):
	var nb_points = 32
	var points_arc = PackedVector2Array()
	points_arc.push_back(center)
	var colors = PackedColorArray([color])
	for i in range(nb_points + 1):
		var angle_point = deg_to_rad(angle_from + i * (angle_to - angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	draw_polygon(points_arc, colors)

func _dwraw():
	draw_circle_arc_poly(Vector2(0,0),500,45,135,Color(1,0,0,0.1))
