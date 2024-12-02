extends Control

enum ACTIONS {UP, DOWN, RIGHT, LEFT, PICKUP, INVENTORY, SETTINGS, HOTBAR1, HOTBAR2, HOTBAR3, HOTBAR4, HOTBAR5, HOTBAR6, HOTBAR7, SHOWDEVTOOL, INTERACT}
var is_customizable=false
var action_string

func _ready():
	update_action_keys()
	
func update_action_keys():
	for input_action in ACTIONS:
		var action_button = get_node("VBoxContainer/ScrollContainer/VBoxContainer/HBox_"+input_action+"/Button")
		action_button.set_pressed(false)
		if InputMap.has_action(input_action):
			if not InputMap.action_get_events(input_action).is_empty():
				action_button.text=InputMap.action_get_events(input_action)[0].as_text()
			else:
				action_button.text="???"

func toggle_action_button(value):
	var action_key = ACTIONS.find_key(value)
	
	is_customizable=true
	action_string=str(action_key)
	
	for input_action in ACTIONS:
		if input_action != action_key:
			get_node("VBoxContainer/ScrollContainer/VBoxContainer/HBox_" + input_action + "/Button").set_pressed(false)

func _input(event):
	if event is InputEventKey and is_customizable:
		change_action_key(event)
		is_customizable=false

func change_action_key(new_key):
	var action_events = InputMap.action_get_events(action_string)
	
	if not action_events.is_empty():
		InputMap.action_erase_event(action_string, action_events[0])
	
	for i in ACTIONS:
		if InputMap.action_has_event(i, new_key):
			InputMap.action_erase_events(i)
	
	InputMap.action_add_event(action_string, new_key)
	
	update_action_keys()

func _on_move_up_button_pressed() -> void:
	toggle_action_button(ACTIONS.UP)

func _on_move_down_button_pressed() -> void:
	toggle_action_button(ACTIONS.DOWN)

func _on_move_left_button_pressed() -> void:
	toggle_action_button(ACTIONS.LEFT)

func _on_move_right_button_pressed() -> void:
	toggle_action_button(ACTIONS.RIGHT)

func _on_pickup_button_pressed() -> void:
	toggle_action_button(ACTIONS.PICKUP)
	
func _on_Inventory_button_pressed() -> void:
	toggle_action_button(ACTIONS.INVENTORY)

func _on_button_pressed() -> void:
	toggle_action_button(ACTIONS.SETTINGS)

func _on_hotbar_1_button_pressed() -> void:
	toggle_action_button(ACTIONS.HOTBAR1)

func _on_hotbar_2_button_pressed() -> void:
	toggle_action_button(ACTIONS.HOTBAR2)

func _on_hotbar_3_button_pressed() -> void:
	toggle_action_button(ACTIONS.HOTBAR3)

func _on_hotbar_4_button_pressed() -> void:
	toggle_action_button(ACTIONS.HOTBAR4)

func _on_hotbar_5_button_pressed() -> void:
	toggle_action_button(ACTIONS.HOTBAR5)

func _on_hotbar_6_button_pressed() -> void:
	toggle_action_button(ACTIONS.HOTBAR6)

func _on_hotbar_7_button_pressed() -> void:
	toggle_action_button(ACTIONS.HOTBAR7)
	
func _on_show_dev_tool_button_pressed() -> void:
	toggle_action_button(ACTIONS.SHOWDEVTOOL)

func _on_interact_button_pressed() -> void:
	toggle_action_button(ACTIONS.INTERACT)
