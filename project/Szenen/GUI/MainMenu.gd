extends Node2D

var lastScene

var mute = preload ("res://Grafik/Assets/GUI/soundoff.png") 
var music = preload ("res://Grafik/Assets/GUI/sound.png") 


func _ready():
	GlobalScenes.MainMenu = self

func enterScene(_lastScene):
	lastScene = _lastScene
	if !Myglobals.gameInNewState:
		$Menu/Button2/Label2.text = "Spiel fortsetzen"
#		$Menu/Button.visible = false
		


func _on_NeuesSpiel_clicked(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			if !Myglobals.gameInNewState:
				$Control.visible = true
			else:
				Myglobals.gotoScene(GlobalScenes.Avatar)
				

	
func _on_SpielLaden_clicked(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			if(Myglobals.gameInNewState):
				Myglobals.load_score()
			else:
				Myglobals.gotoScene(GlobalScenes.House)
				
func showWarning(txt):
	$WarningLaden/Achtung2.text = txt
	$WarningLaden/Achtung3.text = "Schliessen"
	$WarningLaden.visible = true


func _on_close_clicked(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			$Warning.visible = true
			

func _on_About_clicked(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			$Button4/about.visible = true


func _on_clos_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			$Control.visible = false
			
func restartGame():
	GlobalScenes.reset_all_scenes()
	Myglobals.gameInNewState = true
	Myglobals.gotoScene(GlobalScenes.Avatar)

func _on_neu_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			$Control.visible = false
			restartGame()


func _on_neu_mouse_entered():
	$Control/achtung/Label.add_color_override("font_color", Color("#39c031"))


func _on_neu_mouse_exited():
	$Control/achtung/Label.add_color_override("font_color", Color("#00303a"))




func _on_Music_gui_input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == 1:
		if Music.musicplay == true:
			Music.stop_music()
			$Music.texture = mute
		else:
			Music.start_music()
			$Music.texture = music
			
