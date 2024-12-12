extends Node2D	

@onready var items = $Items
@onready var Item_Spawn_Area = $ItemSpawnArea
@onready var Collision_Shape = $ItemSpawnArea/CollisionShape2D
@onready var Progress_bar = $CanvasLayer/ProgressBar


var visible_trees=1
var tree_area_visible = false

signal too_many_trees

func _ready():
	spawn_random_items(10)
		

#Gets random position within the collision shape
func get_random_position():
	var area_rect = Collision_Shape.shape.get_rect()
	var x = randi_range(0, area_rect.position.x)
	var y = randi_range(0, area_rect.position.y)
	return Item_Spawn_Area.to_global(Vector2(x,y))

#attempts to spawn items until 100 tries have been made or "count" have been spawned
func spawn_random_items(count):
	var attempts = 0
	var spawned_count = 0
	while spawned_count < count and attempts < 100:
		var position = get_random_position()
		position = Global.adjust_drop_position(position)
		spawn_items(Global.spawnable_items[randi() % Global.spawnable_items.size()], position)
		spawned_count +=1
		attempts += 1
		
#Create an instance of the inventory_item scene inside the spawn area 
func spawn_items(data, position):
	var item_scene = preload("res://Scenes/UI/Inventory_Stuff/inventory_item.tscn")
	var item_instance = item_scene.instantiate()
	item_instance.initiate_item(data["type"], data["name"], data["effect"], data["texture"])
	item_instance.global_position=position
	items.add_child(item_instance)
