class_name Settings_menu
extends Control

func _on_master_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,value)
	$MarginContainer/HBoxContainer/VBoxContainer/click.play()

func _on_music_volume_value_changed(value: float) -> void:
	pass # Replace with function body.

func _on_sfx_volume_value_changed(value: float) -> void:
	pass # Replace with function body.

func _on_check_box_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.

func _on_keybinds_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/keybinds.tscn")

func _on_back_to_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main/MainMenu.tscn")
