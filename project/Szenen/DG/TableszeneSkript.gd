extends Node2D

func _ready():
	pass
	
	
func own_init():
	connectTable()

	$Edges.own_init()
	$Modules.own_init()
	
#
#func _on_Button3_pressed():
#	get_tree().reload_current_scene()
#

func connectTable():
	Myglobals.allKnodesBase = $Knodes
	Myglobals.allEdgesBase = $Edges
	Myglobals.allModulesBase = $Modules/YSort
	Myglobals.electricSolver = $ElectricSolver


