extends CharacterBody2D

@export var wander_direction2 : Node2D
@onready var animated_sprite = $npc2
@onready var dialogue = $dialogue

var done = false
var is_chatting_J = false
var player_J
var player_in_chat_zone_J = false
var stopped_J = false
var where_to_look_J = "Look_Down"

func update_animations():
	if velocity == Vector2.ZERO:
		animated_sprite.play(where_to_look_J)
	else:
		if abs(velocity.x) > abs(velocity.y):
			if velocity.x > 0:
				animated_sprite.play("Walk_Right")
			else:
				animated_sprite.play("Walk_Left")
		else:
			if velocity.y > 0:
				animated_sprite.play("Walk_Down")
			else:
				animated_sprite.play("Walk_Up")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("INTERACT") and not done_J:
		print ("chatting w npc")
		$dialogue.start()
		is_chatting_J = true

func _physics_process(delta: float) -> void:
	if not stopped_J:
		velocity = wander_direction2.direction * 20
		move_and_slide()
		update_animations()
	else:
		Where_to_look()
		animated_sprite.play("Look_"+where_to_look_J)

func _on_chat_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_J = body
		player_in_chat_zone_J = true
		stopped_J = true
		dialogue.visible = true

func _on_chat_detection_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_in_chat_zone_J = false
		done_J = false
		stopped_J = false
		dialogue.visible = false

func _on_dialogue_d_finished() -> void:
	done_J = true

func Where_to_look():
	var relative_pos = Global.player_node.position - self.position
	var x_side = ""
	var y_side = ""
	if relative_pos.x > 0:
		x_side = "Right"
	else:
		x_side = "Left"
	if relative_pos.y > 0:
		y_side = "Down"
	else:
		y_side = "Up"
	if abs(relative_pos.x) > abs(relative_pos.y):
		where_to_look_J = x_side
	else:
		where_to_look_J = y_side
	
