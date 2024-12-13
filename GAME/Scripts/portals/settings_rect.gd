extends Area2D

signal OPEN_SESAME

var callable = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		callable = true
		body.Interact_UI.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		callable = false
		body.Interact_UI.visible = false

func _input(event):
	if callable:
		if event.is_action_pressed("INTERACT"):
			OPEN_SESAME.emit()
