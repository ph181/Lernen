extends Node2D


var mute = preload ("res://Grafik/Assets/GUI/soundoff.png") 
var music = preload ("res://Grafik/Assets/GUI/sound.png") 


func _on_Control_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			visible = false


func _on_Speichern_clicked(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			var err = Saver.save_game()
			$Savesucess.visible = true
			if err == 0:
				$Savesucess/Achtung4.text = "Spiel gespeichert."
			else:
				$Savesucess/Achtung4.text = "Spiel nicht gespeichert. Fehler: "+str(err)

func _on_Hauptmenu_clicked(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			Myglobals.gotoScene(GlobalScenes.MainMenu)
			visible = false


func _on_Music_gui_input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == 1:
		if Music.musicplay == true:
			Music.stop_music()
			$Music.texture = mute
		else:
			Music.start_music()
			$Music.texture = music
			

