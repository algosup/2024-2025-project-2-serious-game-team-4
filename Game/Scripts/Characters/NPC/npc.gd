extends CharacterBody2D

@export var NPCname : String
@export var wander_direction : Node2D
@export var spawner : bool
@export var where : Array
@onready var animated_sprite = $AnimatedSprite2D
@onready var dialogue = $dialogue
@onready var exclamation_point = $AnimatedSprite2D/exclam
signal choice

var Asia_items =[
	{"quantity" : 99, "type": "Consumable", "name": "Bambou_seed", "effect": "Plant_a_Bambou", "texture": preload("res://Assets/Icons/icon21.png"), "scene_path" : "res://Scenes/UI/Inventory_Stuff/inventory_item.tscn"},
	{"quantity" : 99, "type": "Consumable", "name": "Mangrove_seed", "effect": "Plant_a_Mangrove ", "texture": preload("res://Assets/Icons/icon21.png"), "scene_path" : "res://Scenes/UI/Inventory_Stuff/inventory_item.tscn"},
	{"quantity" : 99, "type": "Consumable", "name": "Solar_Panels", "effect": "Place down a Solar Panel", "texture": preload("res://Assets/Island_2/SolarPanelicon.png"), "scene_path" : "res://Scenes/UI/Inventory_Stuff/inventory_item.tscn"}
]

var tree_spawned = false
var done = false
var player
var player_in_chat_zone = false
var stopped = false
var where_to_look = "Look_Down"

func update_animations():
	if velocity == Vector2.ZERO:
		animated_sprite.play(where_to_look)
	else:
		if abs(velocity.x) > abs(velocity.y):
			if velocity.x > 0:
				animated_sprite.play("Walk_Right")
			else:
				animated_sprite.play("Walk_Left")
		else:
			if velocity.y > 0:
				animated_sprite.play("Walk_Down")
			else:
				animated_sprite.play("Walk_Up")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("INTERACT") and not done and player_in_chat_zone:
		$dialogue.start()

func _physics_process(_delta: float) -> void:
	if not stopped:
		velocity = wander_direction.direction * 50
		move_and_slide()
		update_animations()
	else:
		Where_to_look()
		animated_sprite.play("Look_"+where_to_look)

func _on_chat_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player = body
		player_in_chat_zone = true
		stopped = true
		dialogue.visible = true
		body.Interact_UI.visible = true

func _on_chat_detection_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_in_chat_zone = false
		done = false
		stopped = false
		dialogue.visible = false
		body.Interact_UI.visible = false

func _on_dialogue_d_finished(index) -> void:
	exclamation_point.visible = false
	done = true
	if spawner:
		SpawnAreas.set_spawn_area(where[index])
		Global.add_item(Asia_items[index], true)
		if not tree_spawned:
			tree_spawned = true
	await get_tree().create_timer(0.000001).timeout
	done = false

func Where_to_look():
	var relative_pos = Global.player_node.position - self.position
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
