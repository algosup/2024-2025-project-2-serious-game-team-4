extends Control

@onready var icon = $TextureRect/ItemIcon
@onready var Quantity_label = $TextureRect/ItemQuantity
@onready var Details_Panel = $DetailsPanel
@onready var Item_Name = $DetailsPanel/ItemName
@onready var Item_Type = $DetailsPanel/ItemType
@onready var Item_Effect = $DetailsPanel/ItemEffect
@onready var Usage_Panel = $UsagePanel
@onready var Assign_Button = $UsagePanel/AssignButton
@onready var Texture_Rect = $TextureRect

#Signals
signal drag_start(slot)
signal drag_stop()

#slot item
var item = null
var slot_index = -1
var is_assigned = false

#set_index
func set_slot_index(new_index):
	slot_index=new_index

func _on_item_button_mouse_entered() -> void:
	if item != null:
		Usage_Panel.visible = false
		Details_Panel.visible = true

func _on_item_button_mouse_exited() -> void: 
	Details_Panel.visible = false

func set_empty():
	icon.texture=null
	Quantity_label.text = ""

func set_item(new_item):
	item=new_item
	icon.texture=item["texture"]
	Quantity_label.text=str(item["quantity"])
	Item_Name.text=str(item["name"])
	Item_Type.text=str(item["type"])
	if item["effect"] != "":
		Item_Effect.text=str("+ ", item["effect"])
	else:
		Item_Effect.text=""
	update_assignment_status()

func _on_drop_button_pressed() -> void:
	if item != null:
		print(item)
		var drop_position = Global.player_node.global_position
		var drop_offset = Vector2(0, 50)
		drop_offset = drop_offset.rotated(Global.player_node.rotation)
		Global.drop_item(item, drop_position+drop_offset)
		Global.remove_item(item["type"], item["effect"])
		Global.remove_hotbar_item(item["type"], item["effect"])
		Usage_Panel.visible=false

func _on_use_button_pressed() -> void:
	Usage_Panel.visible = false
	if item != null and item["effect"] != "":
		if Global.player_node:
			Global.player_node.apply_item_effect(item)
			Global.remove_item(item["type"], item["effect"])
			Global.remove_hotbar_item(item["type"], item["effect"])
			Usage_Panel.visible=false

#Updates hotbar assignment status
func update_assignment_status():
	is_assigned = Global.is_item_assigned_to_hotbar(item)
	if is_assigned:
		Assign_Button.text="Unassign (hotbar)"
	else:
		Assign_Button.text="Assign (hotbar)"

func _on_assign_button_pressed() -> void:
	if item != null:
		if is_assigned:
			Global.unassign_hotbar_item(item["type"], item["effect"])
			is_assigned = false
		else: 
			Global.add_item(item, true)
			is_assigned = true
		update_assignment_status()

#ItemButtons pressed events.
func _on_item_button_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			#this will check if there is an item in the panel, if yes, it will show the usage panel
			if item != null:
				Usage_Panel.visible = !Usage_Panel.visible
				Details_Panel.visible = !Details_Panel.visible
		#This will show that a panel is being clicked on, the color will change to show that and the signal that it is being dragged is emitted
		if event.button_index == MOUSE_BUTTON_RIGHT:
			if event.is_pressed():
				Texture_Rect.modulate = Color (1, 1, 0)
				drag_start.emit(self)
			else:
				Texture_Rect.modulate = Color (1, 1, 1)
				drag_stop.emit()
