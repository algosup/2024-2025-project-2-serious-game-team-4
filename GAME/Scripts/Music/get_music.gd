extends AudioStreamPlayer2D

@export var music_name : String

#This code save at what point the music is so that if the same music is supposed to play in the next area, it doesn't start again

#this part calls the current saved time of the music
func _ready() -> void:
	self.seek(Music.get_music_frame(music_name))

#All three of these save the time at which the music stops
func _on_portal_entered(_destination: Variant, _main_name_destination: Variant, _new_pos: Variant) -> void:
	Music.set_music_frame(music_name, self.get_playback_position())

func _on_portal_normal_entered(_destination: Variant) -> void:
	Music.set_music_frame(music_name, self.get_playback_position())

func _on_portal_same_entered(_destination: Variant) -> void:
	Music.set_music_frame(music_name, self.get_playback_position())
