extends Area2D

<<<<<<< HEAD
<<<<<<< HEAD
signal portal_entered
=======
=======
>>>>>>> DevOfficialEmilien
@export var destination : String
@export var interact : bool

signal portal_entered(destination)
<<<<<<< HEAD
>>>>>>> Emilien
=======
>>>>>>> DevOfficialEmilien

var on_portal = false

func _on_body_entered(body):
	if body.is_in_group('Player'):
		on_portal = true
<<<<<<< HEAD
<<<<<<< HEAD
=======
		if not interact:
			portal_entered.emit(destination)
>>>>>>> Emilien
=======
		body.Interact_UI.visible = true
		if not interact:
			portal_entered.emit(destination)
>>>>>>> DevOfficialEmilien

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		on_portal = false
		body.Interact_UI.visible = false

func _input(event):
	if on_portal:
		if event.is_action_pressed("INTERACT"):
<<<<<<< HEAD
<<<<<<< HEAD
			portal_entered.emit()
			get_tree().change_scene_to_file.bind("res://Scenes/Islands/Island_2.tscn").call_deferred()
=======
			portal_entered.emit(destination)
>>>>>>> Emilien
=======
			portal_entered.emit(destination)
>>>>>>> DevOfficialEmilien
			
