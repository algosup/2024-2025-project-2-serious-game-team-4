extends Area2D
@onready var Building = $"../Factory"
@onready var animated_sprite = $"../../Player"

#This makes it so that when the player goes behind it, ir becomes more opaque, allowing the player to see themselves
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(0.777, 0.777, 0.777, 0.7)
		animated_sprite.z_index = -1

#Reverts the opaqueness
func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(0.777, 0.777, 0.777)
		animated_sprite.z_index = 0
