extends Area2D
@onready var Building = $"../Factory2"
@onready var Building2 = $"../Factory3"
@onready var animated_sprite = $"../../Player"

#This makes it so that when the player goes behind it, ir becomes more opaque, allowing the player to see themselves
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(0.822, 0.822, 0.822, 0.7)
		Building2.modulate = Color(0.822, 0.822, 0.822, 0.8)
		Building2.z_index = +1
		Building.z_index = +1


#Reverts the opaqueness
func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(0.822, 0.822, 0.822)
		Building2.modulate = Color(0.822, 0.822, 0.822)
		Building2.z_index = 0
		Building.z_index = 0
