extends AudioStreamPlayer2D

@export var music_name : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.seek(Music.get_music_frame(music_name))

func _on_portal_entered(destination: Variant, main_name_destination: Variant, new_pos: Variant) -> void:
	Music.set_music_frame(music_name, self.get_playback_position())

func _on_portal_normal_entered(destination: Variant) -> void:
	Music.set_music_frame(music_name, self.get_playback_position())

func _on_portal_same_entered(destination: Variant) -> void:
	Music.set_music_frame(music_name, self.get_playback_position())
