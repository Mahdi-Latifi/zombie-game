extends "res://scripts/states/Zombie_movment.gd"


func _ready():
	Fov_Tolerance=45
	Fov_Distance=500
	Zombie_Speed=80


	
func call_other_zombies():
	var zombies =get_tree().get_nodes_in_group("s-b-zombie")
	for zombie in zombies:
		var State_machine=zombie.get_node("State_Machine")
		var zombies_idle=State_machine.get_node("Zombie_idle")
		if Player_is_in_Fov_Telorance():
			if zombie.position.distance_to(Zombie.position) < 1000:
				zombies_idle.Transitioned.emit(zombies_idle,"V_to_player_command")
		else:
			var zombie_V_to_player_command_state=State_machine.get_node("V_to_player_command")
			zombie_V_to_player_command_state.Transitioned.emit(zombie_V_to_player_command_state,"zombie_movment")
			Transitioned.emit(self,"Zombie_idle")

func Phycics_Update(delta):
	call_other_zombies()
	if Zombie :	
		Move_To_award_Players(Player.position)
