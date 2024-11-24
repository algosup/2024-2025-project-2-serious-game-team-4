extends Node2D	

@onready var items = $Items
@onready var Item_Spawn_Area = $ItemSpawnArea
@onready var Collision_Shape = $ItemSpawnArea/CollisionShape2D
@onready var dev_tool = $CanvasLayer2

func _ready():
	pass #spawn_random_items(10)

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

func _input(event: InputEvent) -> void:
		if event.is_action_pressed("SETTINGS"):
			get_tree().change_scene_to_file("res://Scenes/Menus/settings.tscn")
		if event.is_action_pressed("SHOWDEVTOOL"):
			dev_tool.visible = !dev_tool.visible

func _on_pink_potion_button_pressed() -> void:
	var player = get_node("Player")
	spawn_items(Global.spawnable_items[0], player.position)

func _on_blue_potion_pressed() -> void:
	var player = get_node("Player")
	spawn_items(Global.spawnable_items[1], player.position)

func _on_shroom_pressed() -> void:
	var player = get_node("Player")
	spawn_items(Global.spawnable_items[2], player.position)
