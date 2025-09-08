extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Update_Bar()
	pass
func Update_Bar():
	self.visible=true
	self.value=Global.Player_get_stamina()
	$Stamina_Number.text=str(int(self.value))
