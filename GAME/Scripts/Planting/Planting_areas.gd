extends Area2D

# Reference to the parent node containing all the sprites
@export var sprites_parent : Node2D
@export var player : Node2D
@export var activation_radius : float = 40.0
@export var list : String
@export var Type : String
@export var power : int
@export var idiot_proof : int

signal new_info(Type, num_left)

#These are the items that the Ian in Island2_1 can give the player
var Asia_items =[
	{"quantity" : 1, "type": "Consumable", "name": "Bambou_seed", "effect": "Plant a Bambou", "texture": preload("res://Assets/Icons/icon21.png"), "scene_path" : "res://Scenes/UI/Inventory_Stuff/inventory_item.tscn"},
	{"quantity" : 1, "type": "Consumable", "name": "Wind_Turbines", "effect": "Place a Wind Turbine", "texture": preload("res://Assets/Icons/icon21.png"), "scene_path" : "res://Scenes/UI/Inventory_Stuff/inventory_item.tscn"},
	{"quantity" : 1, "type": "Consumable", "name": "Solar_Panels", "effect": "Place a Solar Panel", "texture": preload("res://Assets/Island_2/SolarPanelicon.png"), "scene_path" : "res://Scenes/UI/Inventory_Stuff/inventory_item.tscn"}
]
var closest = null
var closest_distance : float = 10000000000.0
var num_planted = 0
var num_children = 0


func _ready() -> void:
	#Checks if the Spawning Area has been activated to know if the player can "spawn" stuff in them.
	if SpawnAreas.get_spawn_area(list):
		#This next segment checks the items that where "placed" and saved in the SpawnAreas singleton and makes them appear again
		var spawned = SpawnAreas.get_items_placed(list)
		for children in sprites_parent.get_children():
			num_children += 1
			if children.name in spawned:
				num_planted += 1
				children.visible = true

#Once the player uses the item to spawn an item:
func _on_player_tree_spawn(type) -> void:
	#checks if the Spawning Area has been activated and if the item the player wants to spawn is the right one
	if SpawnAreas.get_spawn_area(list) and type == Type:
		for child in sprites_parent.get_children():
			# Ensure the child is a Sprite so that it doesn't toggle the visibility of something random
			if child is AnimatedSprite2D or Sprite2D:
				#if the child is not visible, it saves it and it's location, if another one is closer, it replaces the other one
				if child.visible == false:
					var distance = child.global_position.distance_to(player.global_position)
					# Check if the player's position matches the sprite's position
					if distance <= activation_radius and child.visible == false:
						if distance < closest_distance:
							closest_distance = distance
							closest = child
		#If closest is null, no items were close enough to show, so give the player the item back, if not, closest will be the closest item, this will show it, save the fact it was showed and take care of the pollution progress
		if closest != null:
			SpawnAreas.set_items_placed(closest.name, list)
			closest.visible = true
			num_planted += 1
			#based on the "power" of the item placed, the progress bars will be moved. Because a bamboo solves less than a solar panel for example
			if num_planted % 8 == 0:
				ProgressBars.set_progress_bar_progress("Player", power)
			if num_planted % 4 == 0:
				ProgressBars.set_progress_bar_progress("Asia", -power)
			new_info.emit(Type, num_children-num_planted)
		else:
			Global.add_item(Asia_items[idiot_proof], true)
		#reset these two variables for the next time an item gets checked
		closest_distance = 10000000000.0
		closest = null
