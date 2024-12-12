extends Area2D
 
@export var destination : String
@export var interact : bool
@export var main_name_destination : String
@export var new_pos : Vector2

signal portal_entered(destination, main_name_destination, new_pos)

var on_portal = false

func _on_body_entered(body):
	if body.is_in_group('Player'):
		on_portal = true
		body.Interact_UI.visible = true
		if not interact:
			portal_entered.emit(destination, main_name_destination, new_pos)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		body.Interact_UI.visible = false
		on_portal = false

func _input(event):
	if on_portal:
		if event.is_action_pressed("INTERACT"):
			portal_entered.emit(destination, main_name_destination, new_pos)
