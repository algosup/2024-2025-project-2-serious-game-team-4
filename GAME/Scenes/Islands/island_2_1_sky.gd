extends Node2D	

@onready var dev_tool = $CanvasLayer2
@onready var Progress_bar = $CanvasLayer/ProgressBar


var visible_trees=1
var i = 0

signal too_many_trees

func _ready():
	while i < 4:
		i += 1
		print(i, get_child(i))
	pass

func _on_player_tree_spawn() -> void:
	print("test")
	if visible_trees < 10:
		Progress_bar.value += 10
		visible_trees += 1
		var area = get_child(2)
		var tree = area.get_child(visible_trees)
		tree.visible = true
	else:
		too_many_trees.emit()
