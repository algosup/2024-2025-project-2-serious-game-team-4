class_name Settings
extends Control

#Sets the value of the sliders to their actual values
func _ready() -> void:
	$"../VBoxContainer/VBoxContainer/Master_volume".value = db_to_linear(AudioServer.get_bus_volume_db(0))
	$"../VBoxContainer/VBoxContainer/Music_volume".value = db_to_linear(AudioServer.get_bus_volume_db(1))
	$"../VBoxContainer/VBoxContainer/SFX_volume".value = db_to_linear(AudioServer.get_bus_volume_db(2))

#Moves to the keybinds scene
func _on_keybinds_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/keybinds.tscn")

#Closes the settings
func _on_back_to_game_pressed() -> void:
	get_tree().change_scene_to_file(PlayerData.get_parent_path())

#all three of these make sure that the sliders know they are no longer being played with so that several of them don't move at the same time
func _on_master_volume_mouse_exited() -> void:
	release_focus()

func _on_music_volume_mouse_exited() -> void:
	release_focus()

func _on_sfx_volume_mouse_exited() -> void:
	release_focus()
