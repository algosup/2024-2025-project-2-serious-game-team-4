extends Control

@onready var hotbar_container = $HBoxContainer

#Drag n Drop
var dragged_slot = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.inventory_updated.connect(_update_hotbar_UI)
	_update_hotbar_UI()

func _update_hotbar_UI():
	clear_hotbar_container()
	for i in range(Global.hotbar_size):
		var slot = Global.inventory_slot_scene.instantiate()
		slot.set_slot_index(i)
		
		slot.drag_start.connect(_on_drag_start)
		slot.drag_stop.connect(_on_drag_end)
		
		hotbar_container.add_child(slot)
		if Global.hotbar_inventory[i] != null:
			slot.set_item(Global.hotbar_inventory[i])
		else: 
			slot.set_empty()
		slot.update_assignment_status()

func clear_hotbar_container():
	while hotbar_container.get_child_count() > 0:
		var child = hotbar_container.get_child(0)
		hotbar_container.remove_child(child)
		child.queue_free()

#Store drag slot reference
func _on_drag_start(slot_control: Control):
	dragged_slot = slot_control

func _on_drag_end():
	var target_slot = get_slot_under_mouse()
	if target_slot and dragged_slot != target_slot:
		drop_slot(dragged_slot, target_slot)
	dragged_slot = null

#Get the current mouse position in the hotbar container's coordinate system
func get_slot_under_mouse() -> Control:
	var mouse_position = get_global_mouse_position()
	for slot in hotbar_container.get_children():
		var slot_rect = Rect2(slot.global_position, slot.size)
		if slot_rect.has_point(mouse_position):
			return slot
	return null

func get_slot_index(slot: Control) -> int:
	for i in range(hotbar_container.get_child_count()):
		if hotbar_container.get_child(i) == slot:
			# Valid slot found
			return i
	# No slot found
	return -1

func drop_slot(slot1: Control, slot2: Control):
	var slot1_index = get_slot_index(slot1)
	var slot2_index = get_slot_index(slot2)
	if slot1_index == -1 or slot2_index == -1:
		print("invalid, no slots found")
		return
	else:
		if Global.swap_hotbar_items(slot1_index, slot2_index):
			_update_hotbar_UI()
