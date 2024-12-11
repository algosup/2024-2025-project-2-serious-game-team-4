extends Area2D

# Reference to the parent node containing all the sprites
@export var sprites_parent : Node2D
@export var player : Node2D
@export var activation_radius : float = 40.0
@export var list : String
@export var Type : String
var closest = null
var closest_distance : float = 10000000000.0

func _ready() -> void:
	if SpawnAreas.get_spawn_area(list):
		var spawned = SpawnAreas.get_items_placed(list)
		for children in sprites_parent.get_children():
			if children.name in spawned:
				children.visible = true

func _on_player_tree_spawn(type) -> void:
	if SpawnAreas.get_spawn_area(list) and type == Type:
		for child in sprites_parent.get_children():
			# Ensure the child is a Sprite or has the necessary properties
			if child is Sprite2D:
				if child.visible == false:
					var distance = child.global_position.distance_to(player.global_position)
					# Check if the player's position matches the sprite's position
					if distance <= activation_radius and child.visible == false:
						if distance < closest_distance:
							closest_distance = distance
							closest = child
		if closest != null:
			SpawnAreas.set_items_placed(closest.name, list)
			closest.visible = true
		closest_distance = 10000000000.0