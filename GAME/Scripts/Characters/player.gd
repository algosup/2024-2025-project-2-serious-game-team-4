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

var speed = 150
var last_move = ""
var in_tree_spawn = false
var called = false
var temp_speed = 0
var tuto = false
var tuto_visible = 0

signal tree_spawn(type)

@onready var Pickup_Label = $Interact_Pick_Up_UI/ColorRect/Label
@onready var Interact_Label = $Interact_UI/ColorRect/Label

func _ready():
	footsteps.pitch_scale = 2.0
	speed = PlayerData.get_player_speed()
	temp_speed = speed
	self.position=PlayerData.get_position(get_parent().name)
	last_move=PlayerData.get_rotation(get_parent().name)
	animated_sprite.play(last_move)
	Global.set_player_reference(self)
	Pickup_Label.text="Press %s to pickup" % [InputMap.action_get_events("PICKUP")[0].as_text()]
	Interact_Label.text="Press %s to Interact" % [InputMap.action_get_events("INTERACT")[0].as_text()]
	if not PlayerData.get_tuto():
		tuto_visible = 0
		tuto_UI.visible = true
		$Tuto/Skip.visible = true
		tuto_UI.get_child(tuto_visible).visible = true
		tuto = true
		speed = 0

func get_input():
	var input_direction = Input.get_vector("LEFT","RIGHT","UP","DOWN")
	velocity=input_direction * speed
		
#basic left, right, up, down movement for the player
func _physics_process(_delta: float) -> void:
	get_input()
	move_and_slide()
	update_animations()

func play_footsteps():
	if not footsteps.playing:
		footsteps.play()

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

func _input(event):
	if event.is_action_pressed("INVENTORY"):
		Inventory_UI.visible = !Inventory_UI.visible
		hotbar_UI.visible = !hotbar_UI.visible
	if event.is_action_pressed("SETTINGS"):
		Settingss.visible = !Settingss.visible
	if event.is_action_pressed("INFO_CARD"):
		Info_ui.hide()
		if tuto == true:
			tuto_UI.get_child(tuto_visible).visible = false
			if tuto_visible == 8:
				speed = temp_speed
				PlayerData.set_tuto()
				tuto_UI.visible = false
				$Tuto/Skip.visible = false
			else:
				tuto_visible += 1
				tuto_UI.get_child(tuto_visible).visible = true
			
		

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
			if in_tree_spawn:
				tree_spawn.emit("Bambou")
		"Place a Wind Turbine":
			if in_tree_spawn:
				tree_spawn.emit("Wind_Turbine")
		"Place a Solar Panel":
			if in_tree_spawn:
				tree_spawn.emit("Solar_Panel")

#Hotbar shortcut keys
func use_hotbar_item(slot_index):
	if slot_index < Global.hotbar_inventory.size():
		var item = Global.hotbar_inventory[slot_index]
		if item != null:
			#use item at slot
			apply_item_effect(item)
			#Remove item
			item["quantity"] -= 1
			if item["quantity"] <= 0:
				Global.hotbar_inventory[slot_index] = null
				Global.remove_item(item["type"], item["effect"])
			Global.inventory_updated.emit()

#Hotbar shortcuts usage
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		for i in range(Global.hotbar_size):
			if Input.is_action_just_pressed("HOTBAR" + str(i + 1)):
				use_hotbar_item(i)
				break

func _on_tree_planting_area_body_entered(_body: Node2D) -> void:
	in_tree_spawn = true

func _on_tree_planting_area_body_exited(_body: Node2D) -> void:
	in_tree_spawn = false
	
func save_player_data():
	PlayerData.set_parent_path(get_parent().get_scene_file_path())
	PlayerData.set_position(self.position, get_parent().name)
	PlayerData.set_rotation(last_move, get_parent().name)
	PlayerData.set_player_speed(speed)
	
func save_specific_player_data(destination, main_name_destination, new_pos):
	PlayerData.set_parent_path(destination)
	PlayerData.set_position (new_pos, main_name_destination)
	PlayerData.set_rotation (last_move, main_name_destination)
	PlayerData.set_player_speed (speed)

func _on_portal_portal_entered(destination) -> void:
	save_player_data()
	get_tree().change_scene_to_file(destination)
	
func _on_keybinds_pressed() -> void:
	Keybinds.visible = true
	Settingss.visible = false

func _on_portal_back_portal_entered(destination: String, main_name_destination: String, new_pos: Vector2) -> void:
	save_specific_player_data(destination, main_name_destination, new_pos)
	get_tree().change_scene_to_file(destination)

func _on_back_to_game_pressed() -> void:
	Keybinds.visible = false
	Settingss.visible = false

func _on_back_pressed() -> void:
	Keybinds.visible = false
	Settingss.visible = true

func _on_npc_talking(done: Variant) -> void:
	if not done:
		speed = 0
	else:
		speed = temp_speed

func _on_npc_show_info(path_to_info: Variant) -> void:
	var info_card = load(path_to_info)
	Info_ui.get_child(0).texture = info_card
	Info_ui.visible = true

func _on_portal_same_area_entered(destination: Vector2) -> void:
	self.position = destination

func _on_progress_bar_new_info(item, amount) -> void:
	Progress_bar.value=ProgressBars.get_progress_bar_progress("Player")
	if Left_To_Plant.visible == true:
		Left_To_Plant.visible = false
	Left_To_Plant.get_child(1).text = "Good job, we still need %s %ss!" % [amount, item]
	Left_To_Plant.visible = true
	if amount == 0:
		Left_To_Plant.get_child(1).text = "Congratulations!"
		await get_tree().create_timer(10).timeout
		Left_To_Plant.visible = false

func _on_skip_button_pressed() -> void:
	$Tuto/Skip.visible = false
	tuto_UI.get_child(tuto_visible).visible = false
	speed = temp_speed
	PlayerData.set_tuto()
	tuto_UI.visible = false

func _on_open_sesame() -> void:
	Settingss.visible = !Settingss.visible
