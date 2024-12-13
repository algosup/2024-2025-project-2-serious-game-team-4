class_name MainMenu
extends Control

@onready var Start_button = $MarginContainer/HBoxContainer/VBoxContainer/Start_button as Button
@onready var Settings_button = $MarginContainer/HBoxContainer/VBoxContainer/Settings_button as Button
@onready var Exit_button = $MarginContainer/HBoxContainer/VBoxContainer/Exit_button as Button
@onready var Credits_button = $MarginContainer/HBoxContainer/VBoxContainer/Credits_button as Button
@export var start_level = preload("res://Scenes/Main/start_from_scratch.tscn") as PackedScene

#Connects all the button signals It could have been done through the node menu but that is cleaner and I am not sure what to do next so might as well
func _ready():
	Start_button.button_down.connect(on_start_pressed)
	Settings_button.button_down.connect(on_settings_pressed)
	Exit_button.button_down.connect(on_exit_pressed)
	Credits_button.button_down.connect(on_credits_pressed)

#Starts the game
func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)

#Opens the settings
func on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/settings.tscn")

#Closes the game
func on_exit_pressed() -> void:
	get_tree().quit()

#The credits will be implemented later so this does nothing for now
func on_credits_pressed() -> void:
	pass
