extends Node


#This script exist to store information in between scenes as godot does not do that by default
#It is called a singleton
#I would like to rename it Global_Inventory but it would break everything on the github so I will wait a bit for that
#Inventory Items:
var inventory = []
var spawnable_items = [
	{"type": "Consumable", "name": "pink potion", "effect": "SpeedIncrease", "texture": preload("res://Assets/Icons/icon1.png")},
	{"type": "Consumable", "name": "blue potion", "effect": "InvertedControls", "texture": preload("res://Assets/Icons/icon3.png")},
	{"type": "Consumable", "name": "shroom", "effect": "Test", "texture": preload("res://Assets/Icons/icon32.png")},
]

#This will be the items that are available only for specific areas
var Asia_items =[
	{"type": "Consumable", "name": "Bambou_seed", "effect": "Plant_a_Bambou", "texture": preload("res://Assets/Icons/icon21.png")},
	{"type": "Consumable", "name": "Wind_Turbine", "effect": "Place a Wind Turbine ", "texture": preload("res://Assets/Icons/icon21.png")},
	{"type": "Consumable", "name": "Solar_Panels", "effect": "Place a Solar Panel ", "texture": preload("res://Assets/Island_2/SolarPanelicon.png")}
]

#Hotbar inventory
var hotbar_size = 7
var hotbar_inventory = []

#Custom signals
#Notifies the game that the inventory has been updated
signal inventory_updated

#Players scene and node reference
var player_node: Node = null
@onready var inventory_slot_scene = preload("res://Scenes/UI/Inventory_Stuff/inventory_slot.tscn")

func _ready():
	#Initializes the number of slots in the inventory, changing the value will change the number of slots
	inventory.resize(27)
	hotbar_inventory.resize(hotbar_size)

func add_item(item, to_hotbar = false):
	var added_to_hotbar = false
	#add to hotbar
	if to_hotbar:
		added_to_hotbar = add_hotbar_item(item)
		inventory_updated.emit()
	if not added_to_hotbar:
		#this function will check the inventory slots to know where to place the item,
		for i in range(inventory.size()):
			 #this will check if an instance of the same item already exists to stack them.
			if inventory[i] != null and inventory[i]["type"] == item["type"] and inventory[i]["effect"] == item["effect"]:
				inventory[i]["quantity"] += item["quantity"]
				inventory_updated.emit()
				return true
		for i in range(inventory.size()):
			#this will check if a spot is empty, in that case, it will fill the spot.
			if inventory[i] == null:
					inventory[i]=item
					inventory_updated.emit()
					return true
			#If the function arrives here, it means there is no more space in the inventory and nowhere to stack it, so it can't add it.
		print("no_space")
		return false

func remove_item(item_type, item_effect):
	for i in range (inventory.size()):
		if inventory[i] != null and inventory[i]["type"] == item_type and inventory[i]["effect"] == item_effect:
			inventory[i]["quantity"] -= 1
			if inventory[i]["quantity"] <= 0:
				inventory[i] = null
			inventory_updated.emit()
			return true
	return false

func increase_inventory_size(extra_slots):
	inventory.resize(inventory.size() + extra_slots)
	inventory_updated.emit()

func set_player_reference(player):
	player_node=player

#This function will adjust where items are dropped to avoid them stacking
func adjust_drop_position(position):
	var radius = 100
	var nearby_items = get_tree().get_nodes_in_group("Items")
	for items in nearby_items:
		if items.global_position.distance_to(position) < radius:
			var random_offest = Vector2(randi_range(-radius, radius), randi_range(-radius, radius))
			position += random_offest
	return position

#This function will call all the functions needed to remove the item from the inventory and put it back
func drop_item(item_data, drop_position):
	var item_scene = load(item_data["scene_path"])
	var item_instance = item_scene.instantiate()
	item_instance.set_item_data(item_data)
	drop_position = adjust_drop_position(drop_position)
	item_instance.global_position=drop_position
	get_tree().current_scene.add_child(item_instance)

func add_hotbar_item(item):
	for i in range(hotbar_inventory.size()):
		#this will check if an instance of the same item already exists to stack them.
		if hotbar_inventory[i] != null and hotbar_inventory[i]["type"] == item["type"] and hotbar_inventory[i]["effect"] == item["effect"]:
			hotbar_inventory[i]["quantity"] += item["quantity"]
			return true
	#this function will check the hotbar slots to know where to place the item,
	for i in range(hotbar_size):
		#this will check if a spot is empty, in that case, it will fill the spot.
		if hotbar_inventory[i] == null:
			hotbar_inventory[i]=item
			return true
		#If the function arrives here, it means there is no more space in the inventory and nowhere to stack it, so it can't add it.
	print("no_space")
	return false

func remove_hotbar_item(item_type, item_effect):
	for i in range (hotbar_size):
		if hotbar_inventory[i] != null and hotbar_inventory[i]["type"] == item_type and hotbar_inventory[i]["effect"] == item_effect:
			hotbar_inventory[i]["quantity"] -= 1
			if hotbar_inventory[i]["quantity"] <= 0:
				hotbar_inventory[i] = null
			inventory_updated.emit()
			return true
	return false

func unassign_hotbar_item(item_type, item_effect):
	for i in range (hotbar_size):
		if hotbar_inventory[i] != null and hotbar_inventory[i]["type"] == item_type and hotbar_inventory[i]["effect"] == item_effect:
			hotbar_inventory[i]=null
			inventory_updated.emit()
			return true
	return false

#prevents duplicate item assignments
func is_item_assigned_to_hotbar(item_to_check):
	return item_to_check in hotbar_inventory

func swap_inventory_items(index1, index2):
	if index1 < 0 or index1 > inventory.size() or index2 < 0 or index2 > inventory.size():
		return false
	#swap
	var temp = inventory[index1]
	inventory[index1] = inventory[index2]
	inventory[index2] = temp
	inventory_updated.emit()
	return true

func swap_hotbar_items(index1, index2):
	if index1 < 0 or index1 > hotbar_inventory.size() or index2 < 0 or index2 > hotbar_inventory.size():
		return false
	#swap
	var temp = hotbar_inventory[index1]
	hotbar_inventory[index1] = hotbar_inventory[index2]
	hotbar_inventory[index2] = temp
	inventory_updated.emit()
	return true
