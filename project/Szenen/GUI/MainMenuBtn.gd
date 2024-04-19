extends Node2D





func _on_closeabout_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			$about.visible = false


