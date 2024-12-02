extends Node

signal choice(choice)
@onready var choicesDialog = $"Choices Dialog"

func _on_npc_spawn_tree_area() -> void:
	choicesDialog.choices = ["I want to plant trees!", "Raph c'était pas si dur!"]
	self.visible = true

func _on_choices_dialog_selected(index: Variant) -> void:
	print(index)
