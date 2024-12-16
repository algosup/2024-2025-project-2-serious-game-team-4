extends Area2D
@onready var Building = $"../House"
@onready var animated_sprite = $"../../Player"

#This makes it so that when the player goes behind it, ir becomes more opaque, allowing the player to see themselves
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(1, 1, 1, 0.7)


#Reverts the opaqueness
func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(1, 1, 1)