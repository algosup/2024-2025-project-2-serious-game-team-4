extends Area2D

# Reference to the parent node containing all the sprites
@export var sprites_parent : Node2D
@export var player : Node2D
@export var activation_radius : float = 30.0

func _on_player_tree_spawn() -> void:
	print("detect")
	for child in sprites_parent.get_children():
		print(child)
		# Ensure the child is a Sprite or has the necessary properties
		if child is Sprite2D:
			var distance = child.global_position.distance_to(player.global_position)
			print("yes")
			print(child.global_position)
			print(player.global_position)
			# Check if the player's position matches the sprite's position
			if distance <= activation_radius:
				child.visible = true
