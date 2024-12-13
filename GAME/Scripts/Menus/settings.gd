class_name Settings
extends Control

signal updated

func _ready() -> void:
	$"../VBoxContainer/VBoxContainer/Master_volume".value = db_to_linear(AudioServer.get_bus_volume_db(0))
	$"../VBoxContainer/VBoxContainer/Music_volume".value = db_to_linear(AudioServer.get_bus_volume_db(1))
	$"../VBoxContainer/VBoxContainer/SFX_volume".value = db_to_linear(AudioServer.get_bus_volume_db(2))

func _on_keybinds_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/keybinds.tscn")

func _on_back_to_game_pressed() -> void:
	get_tree().change_scene_to_file(PlayerData.get_parent_path())

func _on_master_volume_mouse_exited() -> void:
	release_focus()
	updated.emit()

func _on_music_volume_mouse_exited() -> void:
	release_focus()
	updated.emit()

func _on_sfx_volume_mouse_exited() -> void:
	release_focus()
	updated.emit()
