extends Node

#This script exist to store information in between scenes as godot does not do that by default
#It is called a singleton
#This one is focused on the SpawnAreas, if they are available and what is spawned in them.

#If the spawn areas are usable
var Spawn_Areas = {"Solar_Panels_Island2_1_Sky" : false, "Bambou_Island2" : false, "Wind_Turbine_Island2" : false}
#what is spawned inside them
var Solar_Panels_Island2_1_Sky = []
var Bambou_Island2 = []
var Wind_Turbine_Island2 = []
#this exists so that i can call the lists using strings
var lists = {
	"Solar_Panels_Island2_1_Sky" : Solar_Panels_Island2_1_Sky,
	"Bambou_Island2" : Bambou_Island2,
	"Wind_Turbine_Island2" : Wind_Turbine_Island2
}

#sets a Spawn area to usable
func set_spawn_area(area):
	Spawn_Areas[area]=true

#saves which items were placed down
func set_items_placed(spawned, list):
	if lists.has(list):
		lists[list].append(spawned)

#return if a Spawn area is usable
func get_spawn_area(area):
	return Spawn_Areas[area]

#Returns which items have already been placed so that they can stay visible.
func get_items_placed(list):
	if lists.has(list):
		return lists[list]
