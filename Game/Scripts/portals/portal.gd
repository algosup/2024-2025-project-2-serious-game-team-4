extends Area2D

signal portal2

func _on_body_entered(body):
	if body.is_in_group('Player'):
		print('collision portal')
		get_tree().change_scene_to_file("res://Scenes/Islands/Island_2.tscn")
		portal2.emit()
