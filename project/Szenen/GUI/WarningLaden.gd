extends "res://Szenen/GUI/Warning.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_newGame_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			SoundFx.buttonsound()
			visible = false
