extends Node2D

@export var group_name : String

var positions : Array
var temp_positions : Array
var current_position2 : Marker2D
var stopped = false

var direction2 : Vector2 = Vector2.ZERO

func _ready() -> void:
	positions = get_tree().get_nodes_in_group(group_name)
	_get_positions()
	_get_next_position()

func _physics_process(delta: float) -> void:
	if global_position.distance_to(current_position2.position) < 10:
		_get_next_position()

func _get_positions():
	temp_positions = positions.duplicate()
	temp_positions.shuffle()

func _get_next_position():
	if temp_positions.is_empty():
		_get_positions()
	current_position2 = temp_positions.pop_front()
	direction2 = to_local(current_position2.position).normalized()
	
