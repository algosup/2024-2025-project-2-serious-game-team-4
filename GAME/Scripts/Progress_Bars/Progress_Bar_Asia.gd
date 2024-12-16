extends ProgressBar

@export var continent : String
#This code exists so that every time the "pollution level" goes down, the bar checks it and matches it

#Sets the value of the progress bar to the value saved on the ProgressBars Singleton
func _ready() -> void:
	self.value=ProgressBars.get_progress_bar_progress(continent)

#Sets the value of the progress bar to the value saved on the ProgressBars Singleton
func _on_bambou_spawn_area_new_info(_Type, _num_left) -> void:
	self.value=ProgressBars.get_progress_bar_progress(continent)
