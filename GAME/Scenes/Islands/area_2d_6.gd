extends Area2D
@onready var Building = $"../ContainerYellow4"
@onready var Building2 = $"../ContainerYellow3"
@onready var Building3 = $"../ContainerDownRed4"
@onready var animated_sprite = $"../../Player"

#This makes it so that when the player goes behind them, they becomes more opaque, allowing the player to see themselves
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(0.753, 0.702, 0, 0.8)
		Building2.modulate = Color(0.753, 0.702, 0, 0.8)
		Building.z_index = +1
		Building2.z_index = +1
		Building3.z_index = +1


#Reverts the opaqueness
func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(0.753, 0.702, 0)
		Building2.modulate = Color(0.753, 0.702, 0)
		Building.z_index = 0
		Building2.z_index = 0
		Building3.z_index = 0
