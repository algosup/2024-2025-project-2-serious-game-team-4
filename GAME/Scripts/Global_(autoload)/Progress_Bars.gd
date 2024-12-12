extends Node

var Progress_Bars_Pollution_Progress = {"Asia" : 100.0, "Player" : 0.0}

func set_progress_bar_progress(area, progress):
	Progress_Bars_Pollution_Progress[area] += progress

func get_progress_bar_progress(area):
	return Progress_Bars_Pollution_Progress[area]
