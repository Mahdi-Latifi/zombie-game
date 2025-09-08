extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():	
	Load_game()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


	
func Load_game():
	var path=Global.get_City_Save_path_()
	if not FileAccess.file_exists(path):
		return
	var save_game = FileAccess.open(path, FileAccess.READ)
	var Save_Data=save_game.get_var(true)
	$Players.position=Vector2(Save_Data["positionx"],Save_Data["positiony"])
