extends Area2D
@onready var Building = $"../Building4"
@onready var animated_sprite = $"../../Player"

#This makes it so that when the player goes behind it becomes more opaque, allowing the player to see themselves
func _on_area_2d_body_entered_behind_building(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(1, 1, 1, 0.71)
		animated_sprite.z_index = -1

#This reverts the opaqueness
func _on_area_2d_body_exited_behind_building(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(1, 1, 1)
		animated_sprite.z_index = 0
