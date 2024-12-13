extends Node

#This script exists to store information in between scenes as godot does not do that by default
#It is called a singleton
#This one is focused on the NPC's dialog. especially on saving where the player is at with the npc's dialog

# Arrays for the dialogue index and ID and to what NPC they are linked
var NPC_Index = {"Ian_Island2_1" : 0, "Mariem_Main" : 0, "JP_Bamboo_Island2" : 0, "Thisma_Solar_Panels_Island2" : 0, "Meryem_Wind_Turbines_Island2" : 0, "Julian_No_Breathe_Island2" : 0, "Meryem_Tutorial_Island2" : 0}
var NPC_Dialogue_ID = {"Ian_Island2_1" : 0, "Mariem_Main" : 0, "JP_Bamboo_Island2" : 0, "Thisma_Solar_Panels_Island2" : 0, "Meryem_Wind_Turbines_Island2" : 0, "Julian_No_Breathe_Island2" : 0, "Meryem_Tutorial_Island2" : 0}

#save the index and dialogue id to a specific NPC
func set_info(NPC, Index, Dialogue_ID):
	NPC_Index[NPC]=Index
	NPC_Dialogue_ID[NPC]=Dialogue_ID

#return the dialog index linked to a specific NPC
func get_Index(NPC):
	return NPC_Index[NPC]

#return the dialog id linked to a specific NPC
func get_Dialogue_ID(NPC):
	return NPC_Dialogue_ID[NPC]
