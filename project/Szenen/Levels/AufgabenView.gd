extends Node2D

class_name Aufgabenview

var previewslvl = []

var LevelsumClass = load("res://Szenen/Levels/LevelSum.tscn")


var aufgabenKapitel = []

func enterScene(_lastScene):
	get_node("/root/Game/gg/AnimationPlayer").play("fadeInScene")


func _on_LevelSum(index):
	open_level(index)

func _on_zurueck_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			Myglobals.gotoScene(GlobalScenes.House)


func open_level(index):
	GlobalScenes.currentChapterLevel = index

	var aufg = aufgabenKapitel[GlobalScenes.currentChapterLevel]
	Myglobals.gotoScene(aufg)

func nextLevel():
	
	if GlobalScenes.currentChapterLevel+1 >=  aufgabenKapitel.size():
		Myglobals.gotoScene(self)
	else:
		open_level(GlobalScenes.currentChapterLevel +1)
		
func load_previews():
	var index = 1
	for l in aufgabenKapitel:
		var nextPreview = LevelsumClass.instance()
		nextPreview.get_node("LvlIndex").text = "Aufgabe " +str(index)
		previewslvl.append(nextPreview)
		$ScrollContainer/HBoxContainer.add_child(nextPreview)
		index +=1
		
	
func completedLvl(fehler): 
	previewslvl[GlobalScenes.currentChapterLevel].completedLvl(fehler)


func _on_ButtonMainMenuBg_clicked(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			Myglobals.gotoScene(GlobalScenes.House)

func save_this():
	var complArr = []
	var fehlerArr = []
	var dir = {}
	for l in previewslvl:
		complArr.append(l.completed)
		fehlerArr.append(l.fehler)
	dir["lvlPreviewCompletedArr"] = complArr
	dir["lvlPreviewFehlerArr"]= fehlerArr
	var aufgaben = []
	for aufg in aufgabenKapitel:
		aufgaben.append(aufg.save_this())
	dir["aufgabenKapitel"] = aufgaben
	return dir
	
func load_this(dict):
	var fehlerArr = dict["lvlPreviewFehlerArr"]
	var complArr = dict["lvlPreviewCompletedArr"]
	for l in previewslvl:
		l.fehler = fehlerArr[l.get_position_in_parent()]
		l.completed = complArr[l.get_position_in_parent()]
		l.checkCompl()
		
	var aufgaben = dict["aufgabenKapitel"]
	for aufg in range (aufgaben.size()):
		aufgabenKapitel[aufg].load_this(aufgaben[aufg])
		
		
