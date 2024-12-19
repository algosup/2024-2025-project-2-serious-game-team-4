extends Area2D

signal Credits()

var callable = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		callable = true
		body.Interact_UI.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		callable = false
		body.Interact_UI.visible = false


#If the player interacts, they ask the player to open the settings menu as it is always loaded on the player to avoid charging times
func _input(event):
	if callable:
		if event.is_action_pressed("INTERACT"):
			Credits.emit()
