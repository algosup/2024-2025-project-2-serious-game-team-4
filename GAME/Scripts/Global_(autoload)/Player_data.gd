extends Node

# This is a singleton to store the players position
var parent_path = ""
#Player position
var player_pos = {"Main" : Vector2.ZERO, "Island2" : Vector2.ZERO}
#Player rotation
var player_rot = {"Main" : "Idle_Left", "Island2" : "Idle_Down"}

var temp_place = ""

func set_position(pos: Vector2, place: String):
	player_pos [place] = pos
	temp_place = place

func set_rotation(rot : String, place: String):
	player_rot [place] = rot
	temp_place = place

func set_parent_path(path):
	parent_path = path

func get_position(place):
	return player_pos [place]

func get_rotation(place):
	return player_rot [place]

func get_parent_path():
	return parent_path
