extends Control

@onready var grid_container = $GridContainer

#Drag n Drop
var dragged_slot = null


func _ready():
	Global.inventory_updated.connect(_on_inventory_updated)
	_on_inventory_updated()

func _on_inventory_updated():
	clear_grid_container()
	#add slots for each position
	for item in Global.inventory:
		var slot = Global.inventory_slot_scene.instantiate()
		slot.drag_start.connect(_on_drag_start)
		slot.drag_stop.connect(_on_drag_end)
		grid_container.add_child(slot)
		if item != null:
			slot.set_item(item)
		else:
			slot.set_empty()

#clear inventory UI grid
func clear_grid_container():
	while grid_container.get_child_count()>0:
		var child = grid_container.get_child(0)
		grid_container.remove_child(child)
		child.queue_free()

#Store drag slot reference
func _on_drag_start(slot_control: Control):
	dragged_slot = slot_control

func _on_drag_end():
	var target_slot = get_slot_under_mouse()
	if target_slot and dragged_slot != target_slot:
		drop_slot(dragged_slot, target_slot)
	dragged_slot = null

#Get the current mouse position in the grid container's coordinate system
func get_slot_under_mouse() -> Control:
	var mouse_position = get_global_mouse_position()
	for slot in grid_container.get_children():
		var slot_rect = Rect2(slot.global_position, slot.size)
		if slot_rect.has_point(mouse_position):
			return slot
	return null

func get_slot_index(slot: Control) -> int:
	for i in range(grid_container.get_child_count()):
		if grid_container.get_child(i) == slot:
			# Valid slot found
			return i
	# No slot found
	return -1

func drop_slot(slot1: Control, slot2: Control):
	var slot1_index = get_slot_index(slot1)
	var slot2_index = get_slot_index(slot2)
	if slot1_index == -1 or slot2_index == -1:
		return
	else:
		if Global.swap_inventory_items(slot1_index, slot2_index):
			_on_inventory_updated()
