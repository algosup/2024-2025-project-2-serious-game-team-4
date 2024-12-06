extends Area2D
@onready var Building = $"../Bat2(2)1FenceSide1-2-5_png(1)"
@onready var Building2 = $"../(2)1FenceSide1-5"
@onready var Building3 = $"../(2)1FenceSide1-6"
@onready var Building4 = $"../(2)1FenceSide1-7"
@onready var Building5 = $"../(2)1FenceSide1-8"
@onready var Building6 = $"../Bat2(2)1FenceSide1-2-6_png(1)"
@onready var Building7 = $"../(2)1FenceSide1-2"
@onready var animated_sprite = $"../../Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(0.777, 0.777, 0.777, 0.7)
		Building2.modulate = Color(0.777, 0.777, 0.777, 0.7)
		Building3.modulate = Color(0.777, 0.777, 0.777, 0.7)
		Building4.modulate = Color(0.777, 0.777, 0.777, 0.7)
		Building5.modulate = Color(0.777, 0.777, 0.777, 0.7)
		Building6.modulate = Color(0.777, 0.777, 0.777, 0.7)
		Building7.modulate = Color(0.777, 0.777, 0.777, 0.7)
		animated_sprite.z_index = -1
		pass

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Building.modulate = Color(0.777, 0.777, 0.777)
		Building2.modulate = Color(0.777, 0.777, 0.777)
		Building3.modulate = Color(0.777, 0.777, 0.777)
		Building4.modulate = Color(0.777, 0.777, 0.777)
		Building5.modulate = Color(0.777, 0.777, 0.777)
		Building6.modulate = Color(0.777, 0.777, 0.777)
		Building7.modulate = Color(0.777, 0.777, 0.777)
		animated_sprite.z_index = 0
		pass
