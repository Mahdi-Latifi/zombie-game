extends Control

var Text_Line:LineEdit
var Load_box:Panel
var viewport_size
var Text_line_exist=false
var Load_box_visible=false
# Called when the node enters the scene tree for the first time.
func _ready():
	viewport_size = get_viewport_rect().size
	Text_Line=$"../../Text_Line"
	Load_box=$"../../Load_box"
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	viewport_size = get_viewport_rect().size
	if Text_line_exist:
		Text_Line_Input_Enter()
	if	Load_box_visible:
		if Input.is_action_pressed("Back_esc"):
			Load_box_visible=false
			Load_box.visible=false
			$New_Game.disabled=false
			$Load_Game.disabled=false
			$Back.disabled=false

func _on_new_game_pressed():
	Text_Line.visible=true
	Text_Line.position= (viewport_size-Text_Line.custom_minimum_size) / 2
	Text_line_exist=true
	$New_Game.disabled=true
	$Load_Game.disabled=true
	$Back.disabled=true

#
func Text_Line_Input_Enter():
	if Input.is_action_pressed("Enter"):
		var FFName = Text_Line.text
		var path = "user://SavedGame/" + FFName # استفاده از "user://" برای ذخیره‌سازی داده‌های کاربر
		var Dir = DirAccess.open(path)
		
		if not Dir:
			# ابتدا مطمئن می‌شویم که پوشه اصلی SavedGame وجود دارد
			var main_save_dir = DirAccess.open("user://SavedGame")
			if not main_save_dir:
				DirAccess.make_dir_absolute("user://SavedGame")
				
			# سپس پوشه مخصوص کاربر را ایجاد می‌کنیم
			var save_dir = DirAccess.open("user://SavedGame")
			if save_dir:
				save_dir.make_dir(FFName)
				
				var player_save_path = path + "/Player.save"
				var city_save_path = path + "/City.save"
				
				var Save_File_Player = FileAccess.open(player_save_path, FileAccess.WRITE)
				var Player_Data = {
					"HP" : 100,
					"Colt":1,
					"Sniper":1,
					"Rifle":0,
					"Shotgun":0,
					"LMG":0,
					"Mag":[30,10,0,0,0]
				}
				Save_File_Player.store_var(Player_Data, true)
				Global.set_Player_Save_path_(player_save_path)
				Save_File_Player.close()
				
				var Save_File_City = FileAccess.open(city_save_path, FileAccess.WRITE)
				var City_Data = {
					"Zombies_positionx":20,
					"Zombies_positiony":20,
					"positionx" : 0,
					"positiony": 0,
				}
				Save_File_City.store_var(City_Data, true)
				Global.set_City_Save_path_(city_save_path)
				Save_File_City.close()
				
				Text_line_exist = false
				get_tree().change_scene_to_file("res://scene/levels/City.tscn")
			else:
				print("Could not create the user's save directory.")
		else:
			print("Folder already exists:", path)
			
	if Input.is_action_pressed("Back_esc"):
		Text_line_exist = false
		Text_Line.visible = false
		$New_Game.disabled = false
		$Load_Game.disabled = false
		$Back.disabled = false
func _on_load_game_pressed():
	Load_box.visible=true
	Load_box.position= (viewport_size-Load_box.custom_minimum_size) / 2
	Load_box_visible=true
	var dir = DirAccess.get_directories_at("res://SavedGame")
	for i in dir:
		var button=Button.new()
		button.pressed.connect(_on_buttons_press.bind(button))
		button.text=i
		$"../../Load_box/ScrollContainer/VBoxContainer".add_child(button)
	$New_Game.disabled=true
	$Load_Game.disabled=true
	$Back.disabled=true
	pass

func _on_buttons_press(button):
	var path = "res://SavedGame/"+button.text
	Global.set_Player_Save_path_(path+"/Player.save")
	Global.set_City_Save_path_(path+"/City.save")
	
	get_tree().change_scene_to_file("res://scene/levels/City.tscn")
	pass

func _on_back_pressed():
	$"../First_menu/SinglePlayer".disabled=false
	$"../First_menu/MulltyPlayer".disabled=false
	$"../First_menu/Settings".disabled=false
	$"../First_menu/Exit".disabled=false
	self.visible=false
	pass # Replace with function body.
