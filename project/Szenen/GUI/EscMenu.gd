extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = !visible

func _on_Control_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			visible = false


func _on_Mission_pressed():
	get_parent().get_node("CurrentAufgabe").get_child(0).get_node("AufgabenFrame").visible = true
	visible = false
