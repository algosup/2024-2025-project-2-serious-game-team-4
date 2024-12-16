extends Sprite2D

@onready var target = $"../../Find_Ian"

var valid = false

func _ready() -> void:
	if get_parent().get_parent().name == "Island2":
		valid = true
	else:
		self.hide()

func _process(_delta):
	if valid:
		point_arrow_to(target.position)

func point_arrow_to(target_position: Vector2):
	var direction = (target_position - global_position).normalized()
	rotation = direction.angle()
