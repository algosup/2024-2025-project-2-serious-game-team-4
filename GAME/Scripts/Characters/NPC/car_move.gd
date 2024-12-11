extends CharacterBody2D

@export var wander_direction : Node2D
@onready var animated_sprite = $AnimatedSprite2D

var player
var stopped = false
var where_to_look = "Look_Down"

func update_animations():
		if abs(velocity.x) > abs(velocity.y):
			if velocity.x > 0:
				animated_sprite.play("Walk_Right")
			else:
				animated_sprite.play("Walk_Left")

func _physics_process(_delta: float) -> void:
	if not stopped:
		velocity = wander_direction.direction2 * 500
		move_and_slide()
		update_animations()

func _on_body_entered_car(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print('collision car')
		get_tree().change_scene_to_file.bind("res://Scenes/Main/start_from_scratch.tscn").call_deferred()
