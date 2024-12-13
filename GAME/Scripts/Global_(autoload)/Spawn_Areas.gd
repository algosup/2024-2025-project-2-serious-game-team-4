extends Node

#This script exist to store information in between scenes as godot does not do that by default
#It is called a singleton
#This one is focused on the SpawnAreas, if they are available and what is spawned in them.

var Spawn_Areas = {"Solar_Panels_Island2_1_Sky" : false, "Bambou_Island2" : false, "Wind_Turbine_Island2" : false}
var Solar_Panels_Island2_1_Sky = []
var Bambou_Island2 = []
var Wind_Turbine_Island2 = []
var lists = {
	"Solar_Panels_Island2_1_Sky" : Solar_Panels_Island2_1_Sky,
	"Bambou_Island2" : Bambou_Island2,
	"Wind_Turbine_Island2" : Wind_Turbine_Island2
}


func set_spawn_area(area):
	Spawn_Areas[area]=true

func get_spawn_area(area):
	return Spawn_Areas[area]

func set_items_placed(spawned, list):
	if lists.has(list):
		lists[list].append(spawned)

func get_items_placed(list):
	if lists.has(list):
		return lists[list]
