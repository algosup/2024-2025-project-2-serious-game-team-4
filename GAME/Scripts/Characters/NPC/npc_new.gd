extends CharacterBody2D

@export var NPCname : String
@export var spawner : bool
@export var where : Array
@export var move_speed : float
@export var maxii : float
@export var path_to_info : String
@onready var animated_sprite = $AnimatedSprite2D
@onready var dialogue = $dialogue
@onready var exclamation_point = $AnimatedSprite2D/exclam
@onready var path = $".."
signal show_info(path_to_info)

signal talking(done)

#The items the NPC's can give to the player in theory
var Asia_items =[
	{"quantity" : 99, "type": "Consumable", "name": "Bambou_seed", "effect": "Plant a Bambou", "texture": preload("res://Assets/Icons/icon21.png"), "scene_path" : "res://Scenes/UI/Inventory_Stuff/inventory_item.tscn"},
	{"quantity" : 16, "type": "Consumable", "name": "Wind_Turbines", "effect": "Place a Wind Turbine", "texture": preload("res://Assets/Icons/icon21.png"), "scene_path" : "res://Scenes/UI/Inventory_Stuff/inventory_item.tscn"},
	{"quantity" : 71, "type": "Consumable", "name": "Solar_Panels", "effect": "Place a Solar Panel", "texture": preload("res://Assets/Island_2/SolarPanelicon.png"), "scene_path" : "res://Scenes/UI/Inventory_Stuff/inventory_item.tscn"}
]

var move_speed_temp
var tree_spawned = false
var done = false
var player
var player_in_chat_zone = false
var stopped = false
var where_to_look = "Look_Down"
var forward = true

var last_position = Vector2.ZERO

#Save the temporary speed as two NPC's could have different speeds so if they stop, I am sure they are set back to the right speed
func _ready() -> void:
	move_speed_temp=move_speed

#Starts the dialogue with the player by calling the dialogue scene linked to the npc scene
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("INTERACT") and not done and player_in_chat_zone:
		$dialogue.start()
		talking.emit(done)

#Makes the player move along the path and keep the right animations
func _physics_process(delta: float) -> void:
	if path.progress < move_speed/10 or path.progress > maxii:
		forward = !forward
	if forward:
		path.progress += move_speed * delta
	else:
		path.progress -= move_speed * delta
	# Check if the NPC is moving
	if move_speed > 1 and forward:
		animated_sprite.play("Walk_Right") # Play walking animation
	elif move_speed > 1 and not forward:
		animated_sprite.play("Walk_Left")
	else:
		Where_to_look()
		animated_sprite.play("Look_"+where_to_look)

#These two next functions track if the player is close enough to chat with the NPC, so that the player doesn't chat cross map with the NPC
func _on_chat_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		move_speed = 0
		player = body
		player_in_chat_zone = true
		stopped = true
		dialogue.visible = true
		body.Interact_UI.visible = true

func _on_chat_detection_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		move_speed = move_speed_temp
		player_in_chat_zone = false
		done = false
		stopped = false
		dialogue.visible = false
		body.Interact_UI.visible = false

#Once the dialog is finished, the NPC will see if it needs to give the player an item or show an info card using the exported variable, if it needs to, it will.
func _on_dialogue_d_finished(index) -> void:
	exclamation_point.visible = false
	done = true
	talking.emit(done)
	if path_to_info != "" and index==0:
		show_info.emit(path_to_info)
	if spawner:
		SpawnAreas.set_spawn_area(where[index])
		if not dialogue.sent_item:
			Global.add_item(Asia_items[index], true)
			Global.add_item(Asia_items[index], false)
			dialogue.sent_item = true
		if not tree_spawned:
			tree_spawned = true
	await get_tree().create_timer(0.000001).timeout
	done = false

#Compares the players position to the NPC's so that the npc can look at the player
func Where_to_look():
	var player_pos_to_check = Global.player_node.global_position
	player_pos_to_check.y -= 25
	var relative_pos = player_pos_to_check - self.global_position
	var x_side = ""
	var y_side = ""
	if relative_pos.x > 0:
		x_side = "Right"
	else:
		x_side = "Left"
	if relative_pos.y > 0:
		y_side = "Down"
	else:
		y_side = "Up"
	if abs(relative_pos.x) > abs(relative_pos.y):
		where_to_look = x_side
	else:
		where_to_look = y_side
