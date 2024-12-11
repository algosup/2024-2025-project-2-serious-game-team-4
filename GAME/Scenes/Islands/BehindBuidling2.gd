extends Area2D
@onready var Building = $"../Sprite2D4"
@onready var animated_sprite = $"../../Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(1,1,1,0.8)
		animated_sprite.z_index = -1
		pass



func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(1,1,1,1)
		animated_sprite.z_index = 0
		pass
