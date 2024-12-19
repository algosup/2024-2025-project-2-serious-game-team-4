extends CharacterBody2D

@onready var Inventory_UI = $Inventory_UI
@onready var Interact_Pick_Up_UI = $Interact_Pick_Up_UI
@onready var Interact_UI = $Interact_UI
@onready var hotbar_UI = $Inventory_Hotbar
@onready var animated_sprite = $AnimatedSprite2D
@onready var Left_To_Plant = $Left_to_Plant
@onready var Settingss = $Settings
@onready var Keybinds = $Keybinds
@onready var footsteps = $AudioStreamPlayer2D
@onready var Info_ui = $Info_UI
@onready var Progress_bar = $Progress_bar/ProgressBar
@onready var tuto_UI = $Tuto/Tuto1
@onready var Arrow = $Arrow
@onready var Ending = $Ending

var speed = 150
var last_move = ""
var in_tree_spawn = false
var called = false
var temp_speed = 0
var tuto = false
var tuto_visible = 0
var dialog_stop = false
var is_moving = false
var num_complete = 0
var Ending_slides_item = ["res://Assets/Ending_Slides/1_Bamboo.png", "res://Assets/Ending_Slides/1_Solar_Panels.png", "res://Assets/Ending_Slides/1_Wind_Turbines.png"]
var Ending_slides_container = ["res://Assets/Ending_Slides/2.png", "res://Assets/Ending_Slides/3.png", "res://Assets/Ending_Slides/4.png", "res://Assets/Ending_Slides/5.png"]
var index = 0

signal tree_spawn(type)
signal tuto_done(is_done)
signal dialog_not_start(dialog_stop)

@onready var Pickup_Label = $Interact_Pick_Up_UI/ColorRect/Label
@onready var Interact_Label = $Interact_UI/ColorRect/Label

#This function happens when the node is first called and checks a lot so check the comments inside for more details
func _ready():
	#gets the amount of times the player has planted everything
	num_complete = PlayerData.get_planted()
	#Makes the footsteps sound faster so it matches the characters walking speed
	footsteps.pitch_scale = 2.0
	#These next few lines grab the info from PlayerData to make sure it spawns at the right place
	speed = PlayerData.get_player_speed()
	temp_speed = speed
	self.position=PlayerData.get_position(get_parent().name)
	last_move=PlayerData.get_rotation(get_parent().name)
	animated_sprite.play(last_move)
	#So the Global Singleton knows who the player is
	Global.set_player_reference(self)
	#As the players can change keys, shows the right key on the tutorial info rectangles
	Pickup_Label.text="Press %s to pickup" % [InputMap.action_get_events("PICKUP")[0].as_text()]
	Interact_Label.text="Press %s to Interact" % [InputMap.action_get_events("INTERACT")[0].as_text()]
	#If the tutorial wasn't done, all of the UI elements will hide to leave only the tutorial which will in turn become visible
	if not PlayerData.get_tuto():
		$Progress_bar.visible = false
		hotbar_UI.visible = false
		tuto_visible = 0
		tuto_UI.visible = true
		$Tuto/Skip.visible = true
		tuto_UI.get_child(tuto_visible).visible = true
		tuto = true
		speed = 0
		tuto_done.emit(false)

#Get the players directional input
func get_input():
	var input_direction = Input.get_vector("LEFT","RIGHT","UP","DOWN")
	velocity=input_direction * speed
		
#Calls all of the functions to move and animate the player
func _physics_process(_delta: float) -> void:
	if not Ending.visible:
		get_input()
		move_and_slide()
		update_animations()

#Play the footsteps sound when the player walks
func play_footsteps():
	if not footsteps.playing:
		footsteps.play()

#Updates the animations according to where the player is walking
func update_animations():
	if velocity == Vector2.ZERO:
		animated_sprite.play(last_move)
	else:
		play_footsteps()
		if abs(velocity.x) > abs(velocity.y):
			if velocity.x > 0:
				animated_sprite.play("Walk_Right")
				last_move = "Idle_Right"
			else:
				animated_sprite.play("Walk_Left")
				last_move = "Idle_Left"
		else:
			if velocity.y > 0:
				animated_sprite.play("Walk_Down")
				last_move = "Idle_Down"
			else:
				animated_sprite.play("Walk_Up")
				last_move = "Idle_Up"

#Opens the right ui according to what the player clicks, The settings are always loaded on the player to avoid loading times if the player wants to change their settings
func _input(event):
	if event.is_action_pressed("INVENTORY"):
		Inventory_UI.visible = !Inventory_UI.visible
		hotbar_UI.visible = !hotbar_UI.visible
		$Progress_bar.visible = !Inventory_UI.visible
		tuto_done.emit($Progress_bar.visible)
	if event.is_action_pressed("SETTINGS"):
		Settingss.visible = !Settingss.visible
	if event.is_action_pressed("INFO_CARD"):
		#if the game is in it's ggwp state:
		if Ending.visible:
			if index >= 4:
				Ending.get_child(1).visible = false
				Ending.get_child(2).visible = true
			else:
				var current_ending_slide=load(Ending_slides_container[index])
				Ending.get_child(1).texture=current_ending_slide
			index += 1
		else:
			#The info card gets shown by the NPC so it should only hide it
			if Info_ui.visible:
				Info_ui.hide()
				$Progress_bar.visible = !Inventory_UI.visible
				tuto_done.emit($Progress_bar.visible)
				dialog_stop = false
				dialog_not_start.emit(dialog_stop)
			#The tutorials are manipulated by the same key as the info card.
			elif tuto == true:
				tuto_UI.get_child(tuto_visible).visible = false
				#That means all the tutorials were shown
				if tuto_visible == 8:
					speed = temp_speed
					#Remebers that the tutorial had been completed and hide/show the relevant UI elements
					PlayerData.set_tuto()
					tuto_UI.visible = false
					$Tuto/Skip.visible = false
					$Progress_bar.visible = true
					hotbar_UI.visible = true
					tuto_done.emit(true)
				else:
					#move to the next tuto card
					tuto_visible += 1
					tuto_UI.get_child(tuto_visible).visible = true

#This function checks the effect attached to an item and applies it
func apply_item_effect(item):
	match item["effect"]:
		"SpeedIncrease":
			speed += 300
			print("Speed up item consumed, speed increased to:", speed)
		"Slot boost":
			Global.increase_inventory_size(5)
			print("Number of item slots increased to:", Global.inventory.size())
		"InvertedControls":
			speed = -speed
			print("Controls inverted, good luck")
		"Test":
			print("test")
		"Plant a Bambou":
			#This items need to be planted in tree planting zones
			if in_tree_spawn:
				tree_spawn.emit("Bambou")
			else:
				Global.add_item({"quantity" : 1, "type": "Consumable", "name": "Bambou_seed", "effect": "Plant a Bambou", "texture": preload("res://Assets/Icons/BambooIcon.png"), "scene_path" : "res://Scenes/UI/Inventory_Stuff/inventory_item.tscn"}, false)
		"Place a Wind Turbine":
			#This items need to be planted in tree planting zones
			if in_tree_spawn:
				tree_spawn.emit("Wind_Turbine")
			else:
				Global.add_item({"quantity" : 1, "type": "Consumable", "name": "Wind_Turbines", "effect": "Place a Wind Turbine", "texture": preload("res://Assets/Icons/WindmillIcon.png"), "scene_path" : "res://Scenes/UI/Inventory_Stuff/inventory_item.tscn"}, false)
		"Place a Solar Panel":
			#This items need to be planted in tree planting zones
			if in_tree_spawn:
				tree_spawn.emit("Solar_Panel")
			else:
				Global.add_item({"quantity" : 1, "type": "Consumable", "name": "Solar_Panels", "effect": "Place a Solar Panel", "texture": preload("res://Assets/Island_2/SolarPanelicon.png"), "scene_path" : "res://Scenes/UI/Inventory_Stuff/inventory_item.tscn"}, false)

#Hotbar shortcut keys, is called by the next function
func use_hotbar_item(slot_index):
	#All the items that are used need to be in a spawned area to be used, so this check is not very smart but it avoids lag when the player spams the hotber item button
	if in_tree_spawn:
		if slot_index < Global.hotbar_inventory.size():
			var item = Global.hotbar_inventory[slot_index]
			if item != null:
				#use item at slot
				apply_item_effect(item)
				#Removes item
				item["quantity"] -= 1
				#Makes the item disappear if none are left
				if item["quantity"] <= 0:
					Global.hotbar_inventory[slot_index] = null
					Global.remove_item(item["type"], item["effect"])
				Global.inventory_updated.emit()

#Hotbar shortcuts usage
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		for i in range(Global.hotbar_size):
			#Check if a key that corresponds to a hotbar input is clicked
			if Input.is_action_just_pressed("HOTBAR" + str(i + 1)):
				use_hotbar_item(i)
				break

#The two next functions track if the player is in an area that allow them to place down an item, It's called tree planting area because it was the clearest name I could come up with
func _on_tree_planting_area_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		in_tree_spawn = true

func _on_tree_planting_area_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		in_tree_spawn = false

#Saves player data to the PlayerData singleton
func save_player_data():
	PlayerData.set_parent_path(get_parent().get_scene_file_path())
	PlayerData.set_position(self.position, get_parent().name)
	PlayerData.set_rotation(last_move, get_parent().name)
	PlayerData.set_player_speed(speed)

#Saves data that is sent by the portal_back which is the portal that sends to a specific location, as the player always set it's position, rotation and speed in accordance to
#What is in the PlayerData singleton, this preemptively changes the data in the singleton so that the player gets spawned at the right place.
func save_specific_player_data(destination, main_name_destination, new_pos):
	PlayerData.set_parent_path(destination)
	PlayerData.set_position (new_pos, main_name_destination)
	PlayerData.set_rotation (last_move, main_name_destination)
	PlayerData.set_player_speed (speed)

#The next three functions are called by the different portals so the player changes in accordance to the portal
func _on_portal_portal_entered(destination) -> void:
	save_player_data()
	get_tree().change_scene_to_file(destination)

func _on_portal_back_portal_entered(destination: String, main_name_destination: String, new_pos: Vector2) -> void:
	save_specific_player_data(destination, main_name_destination, new_pos)
	get_tree().change_scene_to_file(destination)

func _on_portal_same_area_entered(destination: Vector2) -> void:
	self.position = destination

#The next three functions are called by the buttons in the settings and keybinds UI and show/hide the relevant UI
func _on_keybinds_pressed() -> void:
	Keybinds.visible = true
	Settingss.visible = false

func _on_back_to_game_pressed() -> void:
	Keybinds.visible = false
	Settingss.visible = false

func _on_back_pressed() -> void:
	Keybinds.visible = false
	Settingss.visible = true

#If an NPC is talking, it sets the player speed to zero, when the npc stops talking, done will be true so the player will get their normal speed back
func _on_npc_talking(done: Variant) -> void:
	if not done:
		speed = 0
	else:
		speed = temp_speed

#The info cards are always stuck to the player, so when an NPC wants to show it, this function is called, it sets the right texture as set in an export var on the npc
#and shows it.
func _on_npc_show_info(path_to_info: Variant) -> void:
	dialog_stop = true
	dialog_not_start.emit(dialog_stop)
	$Progress_bar.visible = !$Progress_bar.visible
	tuto_done.emit($Progress_bar.visible)
	var info_card = load(path_to_info)
	Info_ui.get_child(1).texture = info_card
	Info_ui.visible = true

#This function puts the progress bar at the right value and also shows the player how much stuff he still needs to place by showing a label and changing what is written on it
func _on_progress_bar_new_info(item, amount) -> void:
	Progress_bar.value=ProgressBars.get_progress_bar_progress("Player")
	if Left_To_Plant.visible == true:
		Left_To_Plant.visible = false
	Left_To_Plant.get_child(1).text = "Good job, we still need %s %ss!" % [amount, item]
	Left_To_Plant.visible = true
	if amount == 0:
		num_complete += 1
		PlayerData.set_planted()
		if num_complete == 3:
			print("hehe")
			ggwp()
		Left_To_Plant.get_child(1).text = "Congratulations!"
		await get_tree().create_timer(10).timeout
		Left_To_Plant.visible = false

#Skips the tutorial
func _on_skip_button_pressed() -> void:
	$Tuto/Skip.visible = false
	tuto_UI.get_child(tuto_visible).visible = false
	speed = temp_speed
	PlayerData.set_tuto()
	tuto_UI.visible = false
	$Progress_bar.visible = true
	hotbar_UI.visible = true
	tuto_done.emit(true)

#This is called by the settings thing on the island where the player spawns. it does the same as pressing the settings hotkey.
func _on_open_sesame() -> void:
	if Keybinds.visible:
		Keybinds.hide()
	else:
		Settingss.visible = !Settingss.visible

#This is called by an NPC at the spawn to show an arrow that points to Ian, this arrow was added after people started to have issues with finding Ian
func _on_show_arrow(state) -> void:
	Arrow.visible = state

#this function will play once the player has filled up all three planting zones.
func ggwp():
	Ending.visible = true
	if Global.first_item == "Bambou_seed":
		var current_ending_slide=load(Ending_slides_item[0])
		Ending.get_child(1).texture=current_ending_slide
	elif Global.first_item == "Wind_Turbines":
		var current_ending_slide=load(Ending_slides_item[2])
		Ending.get_child(1).texture=current_ending_slide
	else:
		var current_ending_slide=load(Ending_slides_item[1])
		Ending.get_child(1).texture=current_ending_slide

func _on_close_game_pressed() -> void:
	get_tree().quit()
