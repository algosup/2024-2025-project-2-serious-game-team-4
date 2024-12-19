extends SubViewport

@onready var minimap = $Minimap
@onready var camera = $Camera2D
@onready var canvas_layer = $"../.."
@onready var player = $"../../../Player"

func _ready() -> void:
	camera.make_current()
	camera.global_position = player.global_position


func _process(delta):
	camera.global_position = player.global_position

#it starts invisible so that the tutorial isn't overlapped by the minimap
func _on_player_tuto_done(is_done: Variant) -> void:
	canvas_layer.visible = is_done
	
