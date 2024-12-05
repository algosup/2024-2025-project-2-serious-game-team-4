extends Area2D

<<<<<<< HEAD
signal portal_entered
=======
@export var destination : String
@export var interact : bool

signal portal_entered(destination)
>>>>>>> Emilien

var on_portal = false

func _on_body_entered(body):
	if body.is_in_group('Player'):
		on_portal = true
<<<<<<< HEAD
=======
		if not interact:
			portal_entered.emit(destination)
>>>>>>> Emilien

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		on_portal = false

func _input(event):
	if on_portal:
		if event.is_action_pressed("INTERACT"):
<<<<<<< HEAD
			portal_entered.emit()
			get_tree().change_scene_to_file.bind("res://Scenes/Islands/Island_2.tscn").call_deferred()
=======
			portal_entered.emit(destination)
>>>>>>> Emilien
			
