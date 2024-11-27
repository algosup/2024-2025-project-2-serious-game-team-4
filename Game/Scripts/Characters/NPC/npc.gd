extends CharacterBody2D

@export var wander_direction : Node2D

var done = false
var is_chatting = false
var player
var player_in_chat_zone = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("INTERACT") and not done:
		print ("chatting w npc")
		$dialogue.start()
		is_chatting = true

func _physics_process(delta: float) -> void:
	velocity = wander_direction.direction * 100
	move_and_slide()

func _on_chat_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player = body
		player_in_chat_zone = true

func _on_chat_detection_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_in_chat_zone = false
		done = false

func _on_dialogue_d_finished() -> void:
	done = true
