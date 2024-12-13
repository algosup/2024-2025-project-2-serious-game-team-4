extends Control

func _on_button_pressed() -> void:
	AudioServer.set_bus_volume_db(0, linear_to_db($VBoxContainer/VBoxContainer/Master_volume.value))
	AudioServer.set_bus_volume_db(1, linear_to_db($VBoxContainer/VBoxContainer/Music_volume.value))
	AudioServer.set_bus_volume_db(2, linear_to_db($VBoxContainer/VBoxContainer/SFX_volume.value))
