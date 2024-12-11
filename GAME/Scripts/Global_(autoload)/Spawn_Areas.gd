extends Node

var Spawn_Areas = {"Island2_1_Sky" : false, "Island2_Bamboo" : false, "Island2_Mangrove" : false}
var amount_of_spawns = {"Island2_1_Sky" : 0, "Island2_Bamboo" : 0, "Island2_Mangrove" : 0}

func set_spawn_area(area):
	Spawn_Areas[area]=true

func get_spawn_area(area):
	return Spawn_Areas[area]

func add_amount_of_spawns(area):
	if amount_of_spawns[area] < 9:
		amount_of_spawns[area]+=1

func get_amount_of_spawns(area):
	return amount_of_spawns[area]
