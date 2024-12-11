extends Node2D	

@onready var dev_tool = $CanvasLayer2
@onready var Progress_bar = $CanvasLayer/ProgressBar

var visible_trees=1
var solar_panel_spawn = 0
var area
var num_already_spawned = -1

signal too_many_trees

func _ready():
	solar_panel_spawn = SpawnAreas.get_spawn_area("Island2_1_Sky")
	if solar_panel_spawn:
		area = get_child(2)
		area.visible = true
	num_already_spawned = SpawnAreas.get_amount_of_spawns("Island2_1_Sky")
	print(num_already_spawned)
	show_trees()

func show_trees() -> void:
	var j = 0
	while j < num_already_spawned:
		var tree = area.get_child(j+2)
		tree.visible = true
		j += 1
	
