extends Control
@export var Secound_sp:PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	$Menu_container/SP_container.visible=false
	$Menu_container/Setting.visible=false
	$Text_Line.visible=false
	$Load_box.visible=false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_single_player_pressed():
	$Menu_container/First_menu/SinglePlayer.disabled=true
	$Menu_container/First_menu/MulltyPlayer.disabled=true
	$Menu_container/First_menu/Settings.disabled=true
	$Menu_container/First_menu/Settings.disabled=true
	$Menu_container/SP_container.visible=true
	$"Menu_container".add_theme_constant_override("separation",10)
