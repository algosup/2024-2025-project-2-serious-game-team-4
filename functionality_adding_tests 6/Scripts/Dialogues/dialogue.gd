extends Control

signal d_finished
@export_file("*.json") var d_file

var dialogue = []
var current_dialogue_id = 0
var d_active = false

func _ready() -> void:
	$NinePatchRect.visible = false

func start():
	if d_active:
		return
	d_active = true
	$NinePatchRect.visible = true
	dialogue = load_dialogue()
	current_dialogue_id = -1
	next_script()
	
func load_dialogue():
	var file = FileAccess.open("res://Scripts/Dialogues/test_npc.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content
	

func _input(event: InputEvent) -> void:
	if !d_active:
		return
	if event.is_action_pressed("ui_accept"):
		next_script()

func next_script():
	current_dialogue_id += 1
	if current_dialogue_id >= len(dialogue):
		d_active = false
		$NinePatchRect.visible = false
		emit_signal("d_finished")
		return
	
	
	$NinePatchRect/name.text = dialogue[current_dialogue_id]['name']
	$NinePatchRect/text.text = dialogue[current_dialogue_id]['text']
