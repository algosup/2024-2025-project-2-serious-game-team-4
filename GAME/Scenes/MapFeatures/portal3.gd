extends Area2D

signal portal3

func _on_body_entered(body):
	if body.is_in_group('Player'):
		print('collision portal3')
		portal3.emit()
		get_tree().change_scene_to_file("res://Scenes/Islands/Island_2_1_Sky.tscn")
		
