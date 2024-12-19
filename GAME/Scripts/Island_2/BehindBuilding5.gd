extends Area2D
@onready var Building = $"../Buildings6"
@onready var animated_sprite = $"../../Player"

#This makes it so that when the player goes behind it becomes more opaque, allowing the player to see themselves
func _on_area_2d_body_entered_behind_building(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(0.843, 0.827, 0.749, 0.77)
		animated_sprite.z_index = -1

#This reverts the opaqueness
func _on_area_2d_body_exited_behind_building(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(0.843, 0.827, 0.749)
		animated_sprite.z_index = 0
