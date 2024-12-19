extends Area2D
@onready var Building = $"../ContainerDown2Yellow"
@onready var Building2 = $"../ContainerDownRed"
@onready var animated_sprite = $"../../Player"

#This makes it so that when the player goes behind them, they becomes more opaque, allowing the player to see themselves
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(0.733, 0.741, 0.349, 0.7)
		Building2.modulate = Color(0.986, 0, 0, 0.7)
		Building.z_index = +1
		Building2.z_index = +1

#Reverts the opaqueness
func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(0.733, 0.741, 0.349)
		Building2.modulate = Color(0.986, 0, 0)
		Building.z_index = 0
		Building2.z_index = 0
