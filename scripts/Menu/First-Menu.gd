extends Control

@export var Secound_sp:PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_single_player_pressed():
	$"First-Menu/VBoxContainer/SinglePlayer".disabled=true
	$"First-Menu/VBoxContainer/MulltyPlayer".disabled=true
	$"First-Menu/VBoxContainer/Settings".disabled=true
	$"First-Menu/VBoxContainer/Exit".disabled=true
	var Sp=Secound_sp.instantiate()
	add_child(Sp)
#	get_node("First-Menu").add_child(Sp)
	$"First-Menu".add_theme_constant_override("separation",100)
	
	
	
	pass # Replace with function body.
