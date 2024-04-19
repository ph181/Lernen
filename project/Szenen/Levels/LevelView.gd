
extends Node2D

class_name LevelView



var levelPreviews= []
var completedLevelPlayed = false
		
func ownInit():
	for l in $ScrollContainer2/HBoxContainer.get_children():
		levelPreviews.append(l)
		if l.completed:
			l.completedLvl()
		

func _on_LevelSum(index):
	get_tree().set_input_as_handled()
	Myglobals.gotoScene(GlobalScenes.currentChapter)
	GlobalScenes.currentChapter.openLevel(index)
			
		
#func enterScene(_lastScene):
#	Myglobals.game.checkFlow()
#	Myglobals.game.checkFlow()
#	Myglobals.game.checkFlow()

func _on_ButtonMainMenuBg_clicked(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			Myglobals.gotoScene(GlobalScenes.House)


func save_this():
	var complArr = []
	
	var dir = {}
	for l in levelPreviews:
		complArr.append(l.completed)
		
	dir["lvlPreviewCompletedArr"] = complArr
	
	return dir
	
func load_this(dict):
	var complArr = dict["lvlPreviewCompletedArr"]
	for l in levelPreviews:
		l.completed = complArr[l.get_position_in_parent()]
		l.checkCompl()


func _on_Control_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			Myglobals.gotoScene(GlobalScenes.currentChapter)
			GlobalScenes.freeExpLvl.remove_Aufgaben()
			GlobalScenes.currentChapter.openLevelFree()

func _on_Control_mouse_entered():
	pass # Replace with function body.


func _on_Control_mouse_exited():
	pass # Replace with function body.
