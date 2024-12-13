extends Area2D
 
@export var destination : String
@export var interact : bool
@export var main_name_destination : String
@export var new_pos : Vector2

signal portal_entered(destination, main_name_destination, new_pos)

var on_portal = false

#Portal Back is a portal that sends the player to a new scene and to a specific location, it does not save it in the Player_Data singleton

#The next two functions check if the player is inside the portal or not to know if it should emit the signal to teleport the player
func _on_body_entered(body):
	if body.is_in_group('Player'):
		on_portal = true
		body.Interact_UI.visible = true
		#the player gets teleported immediately on entry if interact is set to false
		if not interact:
			portal_entered.emit(destination, main_name_destination, new_pos)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		body.Interact_UI.visible = false
		on_portal = false

#send the signal to teleport the player
func _input(event):
	if on_portal:
		if event.is_action_pressed("INTERACT"):
			portal_entered.emit(destination, main_name_destination, new_pos)
