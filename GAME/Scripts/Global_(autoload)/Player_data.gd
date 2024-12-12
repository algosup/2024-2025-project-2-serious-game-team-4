extends Node

# This is a singleton to store the players position
#This is to know where the player is before they change zones
var parent_path = "res://Scenes/Main/start_from_scratch.tscn"
#Player position

var player_pos = {"Main" : Vector2.ZERO, "Island2" : Vector2(49924,-155), "Island2_1" : Vector2.ZERO, "Island2_1_Sky" : Vector2(3,-30), "Island2_2" : Vector2.ZERO}
#Player rotation
var player_rot = {"Main" : "Idle_Left", "Island2" : "Idle_Down", "Island2_1" : "Idle_Down", "Island2_1_Sky" : "Idle_Down", "Island2_2" : "Idle_Down"}
var player_speed : int = 250

func set_position(pos: Vector2, place: String):
	player_pos [place] = pos

func set_rotation(rot : String, place: String):
	player_rot [place] = rot

func set_parent_path(path):
	parent_path = path

func set_player_speed(speed):
	player_speed = speed

func get_position(place):
	return player_pos[place]

func get_rotation(place):
	return player_rot [place]

func get_parent_path():
	return parent_path

func get_player_speed():
	return player_speed
