extends SubViewport

@onready var camera = $Camera2D
@onready var canvas_layer = $"../.."

# sets the minimaps position to the player
func _physics_process(_delta: float) -> void:
	camera.position = owner.find_child("Player").position

#it starts invisible so that the tutorial isn't overlapped by the minimap
func _on_player_tuto_done(is_done: Variant) -> void:
	canvas_layer.visible = is_done
