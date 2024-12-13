extends ProgressBar

@export var continent : String
@onready var Background = $"../ColorRect"

#This code exists so that every time the "pollution level" goes down, the bar checks it and matches it

#Sets the value of the progress bar to the value saved on the ProgressBars Singleton
func _ready() -> void:
	Background.size=Vector2(125,29)
	Background.position=Vector2(89,300)
	self.value=ProgressBars.get_progress_bar_progress(continent)

#Sets the value of the progress bar to the value saved on the ProgressBars Singleton
func _on_bambou_spawn_area_new_info(_Type, _num_left) -> void:
	self.value=ProgressBars.get_progress_bar_progress(continent)
