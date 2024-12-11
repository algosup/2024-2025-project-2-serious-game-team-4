extends Area2D
@onready var Building = $"../ContainerYellow3"
@onready var Building2 = $"../ContainerYellow4"
@onready var Building3 = $"../ContainerDownRed4"
@onready var animated_sprite = $"../../Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(0.752, 0.701, 0, 0.7)
		Building2.modulate = Color(0.752, 0.701, 0, 0.7)
		Building3.modulate = Color(1, 0.248, 0.162, 0.7)
		animated_sprite.z_index = -1
		pass

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(0.752, 0.701, 0)
		Building2.modulate = Color(0.752, 0.701, 0)
		Building3.modulate = Color(1, 0.248, 0.162)
		animated_sprite.z_index = 0
		pass
