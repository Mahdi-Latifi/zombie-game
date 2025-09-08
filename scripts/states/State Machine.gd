extends Node

var Current_state : state
var states : Dictionary ={}

@export var initial_state :state

func _ready():
	if(get_parent() is Player):
		get_parent().connect("Player_Enter",initialaize_Enter_Player)
	else:
		initialaize_Enter_Player()
	pass
			
func _process(delta):	
	if Current_state:
		Current_state.Update(delta)

func _physics_process(delta):
	if Current_state:
		Current_state.Phycics_Update(delta)

func on_child_transition(state,new_state_name):
	if state!=Current_state:
		return
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	if Current_state:
		Current_state.Exit()
	
	new_state.Enter()
	Current_state=new_state

func initialaize_Enter_Player():
	for Child in get_children():
		if Child is state:
			states[Child.name.to_lower()]= Child
			Child.Transitioned.connect(on_child_transition)
		
		if initial_state:
			initial_state.Enter()
			Current_state=initial_state
