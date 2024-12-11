extends Area2D
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD

signal portal_entered
=======
 
@export var destination : String
@export var interact : bool
@export var main_name_destination : String
@export var new_pos : Vector2

signal portal_entered(destination, main_name_destination, new_pos)
>>>>>>> Emilien
=======

signal portal_entered
>>>>>>> parent of 6439eb55f (Portals !)
=======
 
@export var destination : String
@export var interact : bool
@export var main_name_destination : String
@export var new_pos : Vector2

signal portal_entered(destination, main_name_destination, new_pos)
>>>>>>> DevOfficialEmilien

var on_portal = false

func _on_body_entered(body):
	if body.is_in_group('Player'):
		on_portal = true
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
		if not interact:
			portal_entered.emit(destination, main_name_destination, new_pos)
>>>>>>> Emilien
=======
>>>>>>> parent of 6439eb55f (Portals !)
=======
		if not interact:
			portal_entered.emit(destination, main_name_destination, new_pos)
>>>>>>> DevOfficialEmilien

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		on_portal = false

func _input(event):
	if on_portal:
		if event.is_action_pressed("INTERACT"):
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
			portal_entered.emit()
			get_tree().change_scene_to_file.bind("res://Scenes/Main/start_from_scratch.tscn").call_deferred()
=======
			portal_entered.emit(destination, main_name_destination, new_pos)
>>>>>>> Emilien
=======
			portal_entered.emit()
			get_tree().change_scene_to_file("res://Scenes/Main/start_from_scratch.tscn")
>>>>>>> parent of 6439eb55f (Portals !)
=======
			portal_entered.emit(destination, main_name_destination, new_pos)
>>>>>>> DevOfficialEmilien
