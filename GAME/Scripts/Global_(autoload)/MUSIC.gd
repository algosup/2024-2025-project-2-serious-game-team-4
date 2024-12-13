extends Node

var Music_frame = {"Asia_Theme" : 0}


func set_music_frame(music, frame):
	Music_frame[music] = frame

func get_music_frame(music):
	return Music_frame[music]
