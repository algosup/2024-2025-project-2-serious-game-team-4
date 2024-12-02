extends Control

signal d_finished

@export_file("*.json") var d_file

var dialogue = []
var current_dialogue_id = 0
var d_active = false
var response = []
var can_go_next = true
var willing = true

@onready var choicesDialog = $"NinePatchRect/Choices Dialog"
@onready var dialog_text = $dialogue
@onready var container = $NinePatchRect
@onready var container_text = $NinePatchRect/text
@onready var container_name = $NinePatchRect/name

func _ready() -> void:
	print(get_parent().NPCname)
	print(get_tree().current_scene.name)
	container.visible = false

func start():
	if d_active:
		return
	d_active = true
	container.visible = true
	dialogue = load_dialogue()
	current_dialogue_id = -1
	next_script(dialogue)
	
func load_dialogue():
	var file = FileAccess.open("res://Scripts/Dialogues/Dialogs/"+get_parent().NPCname+"_"+get_tree().current_scene.name+"/Dialogue.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content

func load_response():
	var response = true
	var file = FileAccess.open("res://Scripts/Dialogues/Dialogs/"+get_parent().NPCname+"_"+get_tree().current_scene.name+"/Response.json", FileAccess.READ)
	var content = JSON.parse_string((file.get_as_text()))
	dialogue = null
	return content
	

func _input(event: InputEvent) -> void:
	if !d_active:
		return
	if event.is_action_pressed("ui_accept") and can_go_next:
		if response:
			next_script(response)
		else:
			next_script(dialogue)

func next_script(current):
	current_dialogue_id += 1
	if current_dialogue_id >= len(current):
		d_active = false
<<<<<<< HEAD:Game/Scripts/Dialogues/dialogue.gd
		$NinePatchRect.visible = false
		d_finished.emit()
=======
		container.visible = false
		d_finished.emit(willing)
		response = null
>>>>>>> Emilien:GAME/Scripts/Dialogues/dialogue.gd
		return
	container_name.text = current[current_dialogue_id]['name']
	container_text.text = current[current_dialogue_id]['text']
	if current[current_dialogue_id]["Interact"] == 1:
		dialogue_choices(current)



func _on_choices_dialog_selected(index: Variant) -> void:
	print("te")
	can_go_next = true
	if index == 0:
		willing = true
		next_script(dialogue)
	else:
		willing = false
		current_dialogue_id = -1
		response = load_response()
		next_script(response)

func dialogue_choices(current) -> void:
	can_go_next = false
	choicesDialog.choices = current[current_dialogue_id]["Responses"]
	choicesDialog.visible = true
