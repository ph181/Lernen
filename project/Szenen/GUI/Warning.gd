extends Node2D



func _on_close_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			visible = false


func _on_newGame_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			get_tree().quit(-1)
#			visible = false
			


func _on_newGame_mouse_entered():
	$Achtung3.add_color_override("font_color", Color("#39c031"))

func _on_newGame_mouse_exited():
	$Achtung3.add_color_override("font_color", Color("#00303a"))
