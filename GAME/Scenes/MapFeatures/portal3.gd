extends Area2D

signal portal_entered

var on_portal = false

func _on_body_entered(body):
	if body.is_in_group('Player'):
		on_portal = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		on_portal = false

func _input(event):
	if on_portal:
		if event.is_action_pressed("INTERACT"):
			portal_entered.emit()
			get_tree().change_scene_to_file.bind("res://Scenes/Islands/Island_2_1_Sky.tscn").call_deferred()
			
