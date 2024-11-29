extends CharacterBody2D

@onready var Inventory_UI = $Inventory_UI
@onready var Interact_Pick_Up_UI = $Interact_Pick_Up_UI
@onready var hotbar_UI = $Inventory_Hotbar
@onready var animated_sprite = $AnimatedSprite2D
@onready var No_More_trees = $No_More_trees

var speed = 150
var last_move = ""
var in_tree_spawn = false
var called = false

signal tree_spawn

var saved_player_pos=null
var saved_player_rot=null

@onready var Pickup_Label = $Interact_Pick_Up_UI/ColorRect/Label

func _ready():
	speed = PlayerData.get_player_speed()
	print(speed)
	saved_player_pos = PlayerData.get_position(get_parent().name)
	saved_player_rot = PlayerData.get_rotation(get_parent().name)
	self.position=saved_player_pos
	last_move=saved_player_rot
	animated_sprite.play(last_move)
	Global.set_player_reference(self)
	Pickup_Label.text="Press %s to pickup" % [InputMap.action_get_events("PICKUP")[0].as_text()]

func get_input():
	var input_direction = Input.get_vector("LEFT","RIGHT","UP","DOWN")
	velocity=input_direction * speed
		
#basic left, right, up, down movement for the player
func _physics_process(_delta: float) -> void:
	get_input()
	move_and_slide()
	update_animations()

func update_animations():
	if velocity == Vector2.ZERO:
		animated_sprite.play(last_move)
	else:
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
		save_player_data()
		get_tree().change_scene_to_file("res://Scenes/Menus/settings.tscn")

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
		"Plant_a_tree":
			if in_tree_spawn:
				tree_spawn.emit()
				print("tree")

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

func _on_main_too_many_trees() -> void:
	if not called:
		No_More_trees.visible = true
		called = true
		await get_tree().create_timer(2).timeout
		No_More_trees.visible = false
		called = false

func save_player_data():
	PlayerData.set_parent_path(get_parent().get_scene_file_path())
	PlayerData.set_position(self.position, get_parent().name)
	PlayerData.set_rotation(last_move, get_parent().name)
	PlayerData.set_player_speed(speed)

func _on_portal_portal_entered() -> void:
	save_player_data()

func _on_portal_back_portal_entered() -> void:
	save_player_data()
