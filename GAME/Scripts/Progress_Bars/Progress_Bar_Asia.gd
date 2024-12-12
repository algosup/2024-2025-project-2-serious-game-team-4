extends ProgressBar

@export var continent : String

func _ready() -> void:
	self.value=ProgressBars.get_progress_bar_progress(continent)

func _on_bambou_spawn_area_new_info(Type, num_left) -> void:
	self.value=ProgressBars.get_progress_bar_progress(continent)
