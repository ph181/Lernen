extends Control

class_name ExperimentAufgabe

var levelComplete = false

signal completed(i)

func _ready():
	pass


func completed():

	emit_signal("completed",self.get_position_in_parent())
	levelComplete = true
	
