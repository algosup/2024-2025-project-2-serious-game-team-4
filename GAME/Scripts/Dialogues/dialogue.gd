extends Control

signal d_finished
signal to_give(give)

@export_file("*.json") var d_file

var dialogue = []
var current_dialogue_id = 0
var d_active = false
var can_go_next = true
var dialogue_index = 0
var lock = false
var Index = 0
var sent_item = false

@onready var choicesDialog = $"NinePatchRect/Choices Dialog"
@onready var container = $NinePatchRect
@onready var container_text = $NinePatchRect/text
@onready var container_name = $NinePatchRect/name

#Hides the dialog box since the npc is uninterracted and grabs the indexes from the NpcDialog Singleton so that the npc remembers if it was talked to before even if the player changes scene
func _ready() -> void:
	container.visible = false
	current_dialogue_id = NpcDialog.get_Dialogue_ID(get_parent().NPCname+"_"+get_tree().current_scene.name)-1
	dialogue_index = NpcDialog.get_Index(get_parent().NPCname+"_"+get_tree().current_scene.name)

#Start the dialogue
func start():
	if d_active:
		return
	d_active = true
	container.visible = true
	dialogue = load_dialogue()
	current_dialogue_id = -1
	next_script(dialogue)

#Loads the dialog file that corresponds to that NPC
func load_dialogue():
	print("res://Scripts/Dialogues/Dialogs/"+get_parent().NPCname+"_"+get_tree().current_scene.name+"/Dialogue.json")
	var file = FileAccess.open("res://Scripts/Dialogues/Dialogs/"+get_parent().NPCname+"_"+get_tree().current_scene.name+"/Dialogue.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content

#If the script can go next, goes next, if not, ignore.
func _input(event: InputEvent) -> void:
	if !d_active:
		return
	if event.is_action_pressed("ui_accept") and can_go_next:
		next_script(dialogue)

#Advances to the next dialogue script, check the flags in the .json file that holds the dialog, so it knows if it should end, what's the next ste for dialogs
#What text to show and if the choice the player made is worthless. at the end, saves the fact that the player has already talked to that npc and what path they chose
func next_script(current):
	lock = false
	current_dialogue_id += 1
	if current[current_dialogue_id]["ending"] == 1:
		dialogue_index = current[current_dialogue_id]["next_step"]
		d_active = false
		container.visible = false
		d_finished.emit(Index)
		return
	if current[current_dialogue_id]["give"] != 100:
		print(current[current_dialogue_id]["give"])
		to_give.emit(current[current_dialogue_id]["give"])
	while current[current_dialogue_id]["step"] != dialogue_index:
		current_dialogue_id += 1
	container_name.text = current[current_dialogue_id]['name']
	container_text.text = current[current_dialogue_id]['text']		
	if current[current_dialogue_id]["Interact"] == 1:
		if current[current_dialogue_id]["Worthless"] == 1:
			lock = true
		dialogue_choices(current)
	NpcDialog.set_info(get_parent().NPCname+"_"+get_tree().current_scene.name, dialogue_index, current_dialogue_id)

#changes the index in accordance with the players choice, so that the dialog know what the next step they have to take is.
func _on_choices_dialog_selected(index: Variant) -> void:
	Index = index
	if not lock:
		dialogue_index = index
	else:
		dialogue_index = 0
	can_go_next = true
	next_script(dialogue)

#tells the Choices_Dialog what the choices the player has are.
func dialogue_choices(current) -> void:
	can_go_next = false
	choicesDialog.choices = current[current_dialogue_id]["Responses"]
	choicesDialog.visible = true
