extends Area2D
@onready var Building = $"../Homev5"
@onready var animated_sprite = $"../../Player"

#This makes it so that when the player goes behind the building, the building becomes more opaque, allowing the player to see themselves
func _on_area_2d_body_entered_behind_building(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(0.77,0.74,0.69,0.8)
		animated_sprite.z_index = -1

#Reverts the opaqueness
func _on_area_2d_body_exited_behind_building(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(0.77,0.74,0.68,1)
		animated_sprite.z_index = 0
