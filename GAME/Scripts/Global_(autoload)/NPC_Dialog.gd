extends Node

var NPC_Index = {"Ian_Island2_1" : 0, "Mariem_Main" : 0, "Ian_Bamboo_Island2" : 0, "Ian_Solar_Panels_Island2" : 0, "Meryem_Wind_Turbines_Island2" : 0, "Julian_No_Breathe_Island2" : 0, "Meryem_Tutorial_Island2" : 0}
var NPC_Dialogue_ID = {"Ian_Island2_1" : 0, "Mariem_Main" : 0, "Ian_Bamboo_Island2" : 0, "Ian_Solar_Panels_Island2" : 0, "Meryem_Wind_Turbines_Island2" : 0, "Julian_No_Breathe_Island2" : 0, "Meryem_Tutorial_Island2" : 0}

func set_info(NPC, Index, Dialogue_ID):
	NPC_Index[NPC]=Index
	NPC_Dialogue_ID[NPC]=Dialogue_ID

func get_Index(NPC):
	return NPC_Index[NPC]

func get_Dialogue_ID(NPC):
	return NPC_Dialogue_ID[NPC]
