extends Node

# This is a singleton to store the players position
#This is to know where the player is before they change zones
var parent_path = "res://Scenes/Islands/Island_2.tscn"
#Player position
var player_pos = {"Main" : Vector2.ZERO, "Island2" : Vector2(49814,-396), "Island2_1" : Vector2.ZERO, "Island2_1_Sky" : Vector2(3,-30), "Island2_2" : Vector2.ZERO, "Terra_House_Inside" : Vector2.ZERO}
#Player rotation
var player_rot = {"Main" : "Idle_Left", "Island2" : "Idle_Down", "Island2_1" : "Idle_Down", "Island2_1_Sky" : "Idle_Down", "Island2_2" : "Idle_Down", "Terra_House_Inside" : "Idle_Down"}
var player_speed : int = 250
#this is so that the game knows if the player did the tutorial or not
var tuto = false
#this is to know how many times the player has planted
var num_complete = 0

#set's the players position in a specific scene
func set_position(pos: Vector2, place: String):
	player_pos [place] = pos

#set's the players rotation in a specific scene
func set_rotation(rot : String, place: String):
	player_rot [place] = rot

#set a parent path if it needs to be remembered
func set_parent_path(path):
	parent_path = path

#set's the players speed
func set_player_speed(speed):
	player_speed = speed

#set's the tutorial's state, so that it doesn't happen twice
func set_tuto():
	tuto = true

func set_planted():
	num_complete += 1

#return the players position in a specific scene
func get_position(place):
	print(place)
	return player_pos[place]
	
#return the players rotation in a specific scene
func get_rotation(place):
	return player_rot [place]

#return the parent path if needed
func get_parent_path():
	return parent_path
	
#return the parent path if needed
func get_player_speed():
	return player_speed

#return the tutorial 
func get_tuto():
	return tuto

func get_planted():
	return num_complete
