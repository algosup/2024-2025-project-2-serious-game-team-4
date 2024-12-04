extends Area2D


func _on_body_entered(body):
	if body.is_in_group('Player'):
		print('collision portal')
		get_tree().change_scene_to_file.bind("res://Scenes/Islands/Island_2.tscn").call_deferred()
		
