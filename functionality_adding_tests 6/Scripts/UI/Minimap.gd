extends SubViewport

@onready var camera = $Camera2D

# sets the minimaps position to the player
func _physics_process(delta: float) -> void:
	camera.position = owner.find_child("Player").position
