extends Area2D

@export var destination : String
@export var interact : bool

signal portal_entered(destination)

var on_portal = false

#The portal teleports the player to a new scene, to the location saved in the Player_Data singleton

#The next two functions check if the player is inside the portal or not to know if it should emit the signal to teleport the player
func _on_body_entered(body):
	if body.is_in_group('Player'):
		on_portal = true
		body.Interact_UI.visible = true
		if not interact:
			portal_entered.emit(destination)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		on_portal = false
		body.Interact_UI.visible = false

#send the signal to teleport the player
func _input(event):
	if on_portal:
		if event.is_action_pressed("INTERACT"):
			portal_entered.emit(destination)
			
