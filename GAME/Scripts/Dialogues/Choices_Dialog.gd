extends PanelContainer

signal SELECTED(index)

@onready var choices_list = $"MarginContainer/Choices"
@onready var choice_prefab = $"MarginContainer/Choices/Choice Button"

#initiates the coices
var choices:
	set(value):
		choices = value
		initButtons()

#binds the choices as buttons and link them to the dialogue.gd so the player can interact with them
func _ready():
	choices_list.get_child(0).pressed.connect(onChoice.bind(0))

#Creates the buttons according to the number of choices adds the text and links it to the dialogue.gd code
func initButtons():
	var button
	
	while choices_list.get_child_count() > 1:
		button = choices_list.get_child(choices_list.get_child_count() - 1)
		choices_list.remove_child(button)
		button.queue_free()
		
	for choice_index in range(choices.size()):
		if (choice_index == 0):
			choices_list.get_child(0).text = choices[choice_index]
		else:
			choices_list.add_child(choice_prefab.duplicate())
			choices_list.get_child(choice_index).text = choices[choice_index]
			choices_list.get_child(choice_index).pressed.connect(onChoice.bind(choice_index))

#Once the player chooses a button, hide it and emit which one
func onChoice(choice_index):
	visible = false
	SELECTED.emit(choice_index)
