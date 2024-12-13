extends Node

#This script exists to store information in between scenes as godot does not do that by default
#It is called a singleton
#This one is focused on the music and at what point it should start playing

#saves the musics and how far we've gone in it
var Music_frame = {"Asia_Theme" : 0, "America_Theme" : 0}
var Musics = ["Asia_Theme", "America_Theme"]

#I don't want the game to permanently remember, I just want it to not have to start over if the music is supposed to be the same in the next scene the player goes in.
func set_music_frame(music, frame):
	#removes all other saved music frames and only keeps the last one
	for i in Musics:
		if i == music:
			Music_frame[i] = frame
		else:
			Music_frame[i] = 0

#returns the saved part the music is supposed to start to play at
func get_music_frame(music):
	return Music_frame[music]
