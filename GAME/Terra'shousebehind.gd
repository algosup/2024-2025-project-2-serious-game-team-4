extends Area2D
@onready var Building = $"../Menu_Island/House"
@onready var animated_sprite = $"../../Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(0,0,0, 0.7)
		pass

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(1, 1, 1)
		pass
