extends Area2D
@onready var Building = $"../Homev5"
@onready var animated_sprite = $"../../Player"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_area_2d_body_entered_behind_building(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(0.77,0.74,0.69,0.8)
		animated_sprite.z_index = -1
		pass # Replace with function body.

func _on_area_2d_body_exited_behind_building(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(0.77,0.74,0.68,1)
		animated_sprite.z_index = 0
		pass # Replace with function body.
