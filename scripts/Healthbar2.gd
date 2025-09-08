extends ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	pass	
func _process(delta):
	self.visible=true
	Update_Healthbar()
	
func Update_Healthbar():
	self.visible=true
	self.value=Global.Player_health_get()
	$Hp_Number.text=str(self.value)

