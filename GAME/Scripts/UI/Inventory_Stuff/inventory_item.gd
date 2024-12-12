@tool
extends Node2D

#These will be the information associated to our item, it's type, name, effect and it's texture's location in the tree
@export var item_type=""
@export var item_name=""
@export var item_effect=""
@export var item_texture: Texture

#this is the scene path because it's easier to have it saved for what I am trying to do
var scene_path = "res://Scenes/UI/Inventory_stuff/inventory_item.tscn"

#This will makes it so that the items texture will only appear once the right one has been used.
@onready var sprite = $Sprite2D

#This will store if the player is in pickup range or not
var player_in_pickup_range = false
# Declare a variable to track if the item is being picked up
var is_picking_up: bool = false

# Called when the node enters the scene tree for the first time.	
func _ready() -> void:
	#This checks if we are in the editor or the game, That way, I can test stuff easier while in the editor, without creating test code or affecting the game
	if not Engine.is_editor_hint():
		sprite.texture=item_texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#This checks if we are in the editor or the game, That way, I can test stuff easier while in the editor, without creating test code or affecting the game
	if Engine.is_editor_hint():
		sprite.texture=item_texture
		
	if player_in_pickup_range and Input.is_action_just_pressed("PICKUP") and not is_picking_up:
		is_picking_up = true  # Lock the pickup state
		pickup_item()

func pickup_item():
	#This will be the info that will be transfered to the inventory, it can obviously be modified
	var item = {
		"quantity": 1,
		"type": item_type,
		"name": item_name,
		"effect": item_effect,
		"texture": item_texture,
		"scene_path": scene_path
	}
	#If the player is trying to pick this instance of an item up, you give them the item and terminate this instance to avoid lag
	if Global.player_node:
		Global.add_item(item, false)
		self.queue_free()
#If an items range is entered by the player, show the UI and allow the player to pick it up
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_in_pickup_range = true
		body.Interact_Pick_Up_UI.visible = true

#If an items range is exited by the player, hide the UI and don't allow the player to pick it up
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_in_pickup_range = false
		body.Interact_Pick_Up_UI.hide()

func set_item_data(data):
	item_type = data["type"]
	item_name = data["name"]
	item_effect = data["effect"]
	item_texture = data["texture"]

#Set the items values for spawning
func initiate_item(type, name, effect, texture):
	item_type = type
	item_name = name
	item_effect = effect
	item_texture = texture
