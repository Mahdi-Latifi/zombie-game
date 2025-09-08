extends Node

var current_weapon:weapons
var weapons:Dictionary={}
var colt
var Sniper
var shotgun
var Rifle
var LMG
@export var Start_weapon :weapons

func _ready():
	get_parent().connect("Player_Enter",initialaize_Enter_Player)
	pass
	
func _process(delta):
	if Input.is_action_just_pressed("Colt") and colt:
		current_weapon=weapons.get("colt")
		current_weapon.Enter()
	if Input.is_action_just_pressed("Sniper_Rifle") and Sniper:
		current_weapon=weapons.get("sniper_rifle")
		current_weapon.Enter()
	if Input.is_action_just_pressed("Rifle") and Rifle:
		current_weapon=weapons.get("rifle")
		current_weapon.Enter()
	if Input.is_action_just_pressed("Shotgun") and Sniper:
		current_weapon=weapons.get("shotgun")
		current_weapon.Enter()
	if Input.is_action_just_pressed("LMG") and LMG:
		current_weapon=weapons.get("lmg")
		current_weapon.Enter()
	current_weapon.Update()

func Load_game():
	
	var path=Global.get_Player_Save_path_()
	if not FileAccess.file_exists(path):
		return
	var save_game = FileAccess.open(path, FileAccess.READ)
	var Save_Data=save_game.get_var(true)
	colt=Save_Data["Colt"]
	Sniper=Save_Data["Sniper"]
	Rifle=Save_Data["Rifle"]
	shotgun=Save_Data["Shotgun"]
	LMG=Save_Data["LMG"]
	save_game.close()
	
func initialaize_Enter_Player():
	Load_game()
	for Child in get_children():
		if Child is weapons:
			weapons[Child.name.to_lower()]= Child
					
		if Start_weapon:
			Start_weapon.Enter()
			current_weapon=Start_weapon
