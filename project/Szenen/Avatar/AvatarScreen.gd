extends Node2D



func _ready():
	GlobalScenes.Avatar = self


func _on_start_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			Myglobals.gotoScene(GlobalScenes.House)



func _on_zurueck_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			Myglobals.gotoScene(GlobalScenes.MainMenu)
