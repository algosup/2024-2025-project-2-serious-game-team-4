extends Node

#This script exist to store information in between scenes as godot does not do that by default
#It is called a singleton
#This one is focused on the progress bars and their progress

var Progress_Bars_Pollution_Progress = {"Asia" : 100.0, "Player" : 0.0}

#saves the progress of a specific progress bar
func set_progress_bar_progress(area, progress):
	Progress_Bars_Pollution_Progress[area] += progress

#returns the progress of a specific progress bar
func get_progress_bar_progress(area):
	return Progress_Bars_Pollution_Progress[area]
