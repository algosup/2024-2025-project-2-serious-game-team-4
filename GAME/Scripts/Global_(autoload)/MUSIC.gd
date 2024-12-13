extends Node

var Music_frame = {"Asia_Theme" : 0, "America_Theme" : 0}
var Musics = ["Asia_Theme", "America_Theme"]

func set_music_frame(music, frame):
	for i in Musics:
		if i == music:
			Music_frame[i] = frame
		else:
			Music_frame[i] = 0

func get_music_frame(music):
	return Music_frame[music]
