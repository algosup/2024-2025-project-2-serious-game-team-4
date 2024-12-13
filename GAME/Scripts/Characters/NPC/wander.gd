extends Node2D

@export var group_name : String

var positions : Array
var temp_positions : Array
var current_position : Marker2D
var stopped = false

var direction : Vector2 = Vector2.ZERO
#gets the marker2D's in the same group as the NPC and stores them in an array, calls the function to get the target position and the next one as well
func _ready() -> void:
	positions = get_tree().get_nodes_in_group(group_name)
	_get_positions()
	_get_next_position()

#check which marker the NPC need to move towards and moves towards it
func _physics_process(_delta: float) -> void:
	if global_position.distance_to(current_position.position) < 10:
		_get_next_position()

#adds in the position of the markers to the array
func _get_positions():
	temp_positions = positions.duplicate()
	temp_positions.shuffle()

#gets the next position towards which the npc should move
func _get_next_position():
	if temp_positions.is_empty():
		_get_positions()
	current_position = temp_positions.pop_front()
	direction = to_local(current_position.position).normalized()
	
