extends TileMapLayer

@onready var Water1 = $Water1
@onready var Water2 = $Water2
@onready var Water3 = $Water3

var loops = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if loops == 3:
		loops = 0
	else:
		loops += 1
	water_management_function(loops)


func water_management_function(loops):
	if loops == 0 :
		Water1.visible = true
		Water2.visible = false
		Water3.visible = false
		await get_tree().create_timer(30).timeout

	if loops == 1 :
		Water1.visible = false
		Water2.visible = true
		Water3.visible = false
		await get_tree().create_timer(30).timeout

	if loops == 2 :
		Water1.visible = false
		Water2.visible = false
		Water3.visible = true
		await get_tree().create_timer(30).timeout
