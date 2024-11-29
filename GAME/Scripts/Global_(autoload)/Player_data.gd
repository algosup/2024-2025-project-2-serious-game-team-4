extends Node

# This is a singleton to store the players position 

#Player position
var player_pos : Vector2 = Vector2.ZERO
#Player rotation
var player_rot : String = ""

func set_position(pos: Vector2):
	player_pos = pos

func set_rotation(rot : String):
	player_rot = rot
	print(player_rot)

func get_position():
	return player_pos

func get_rotation():
	return player_rot
