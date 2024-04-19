extends Node2D

class_name Kapitel

export var levelComplete :bool = false
export var currentLevel : int = 0
export  (Array,PackedScene)var levels = []

var lastScene 

func enterScene(_lastScene):
	if _lastScene is  BookRoom:
		pass
	else:
		lastScene = _lastScene
	

	
	
	
func levelCompleted():
	if !levelComplete:
		levelComplete = true
		$Lvlend.visible = true
		$LevelComplete/AnimationPlayer.play("lvlend")
		
func _on_AufgabenListe_aufgabenComplete():
	levelCompleted()
	GlobalScenes.LvlView.levelPreviews[currentLevel].completedLvl(-1)
	Myglobals.progressInfo.progressMade()

func _on_Continue_gui_input(event):
	if event is InputEventMouseButton :
		if event.button_index == 1 and event.is_pressed():
			
			if currentLevel+1 >= levels.size():
				Myglobals.gotoScene(GlobalScenes.LvlView)
				return
			openLevel(currentLevel+1)

func openLevel(index):
	currentLevel = index
	
	if $CurrentAufgabe.get_child_count() >0:
		disconnectAufgaben()
		$CurrentAufgabe.remove_child($CurrentAufgabe.get_child(0))
			
	$CurrentAufgabe.add_child(levels[index])
	connectAufgaben()
	resetAnims()

func openLevelFree():
	if $CurrentAufgabe.get_child_count() >0:
		disconnectAufgaben()
		$CurrentAufgabe.remove_child($CurrentAufgabe.get_child(0))
	if GlobalScenes.freeExpLvl.get_parent() != null:
		GlobalScenes.freeExpLvl.get_parent().remove_child(GlobalScenes.freeExpLvl)
	$CurrentAufgabe.add_child(GlobalScenes.freeExpLvl)
	$CurrentAufgabe.get_child(0).connectTableAufgaben()
	resetAnims()
	
func connectAufgaben():
	$CurrentAufgabe.get_child(0).connectTableAufgaben()
	var error = $CurrentAufgabe.get_child(0).connect("aufgabenComplete",self,"_on_AufgabenListe_aufgabenComplete")
	if error != OK:
		print("Failed to connect signal: ", error)
	
func disconnectAufgaben():
	$CurrentAufgabe.get_child(0).disconnectTableAufgaben()
	if $CurrentAufgabe.get_child(0).is_connected("aufgabenComplete",self,"_on_AufgabenListe_aufgabenComplete"):
		$CurrentAufgabe.get_child(0).disconnect("aufgabenComplete",self,"_on_AufgabenListe_aufgabenComplete")
	
	

	

func resetAnims():
	$Lvlend.visible = false
	$Lvlend.modulate.a = 0
	$LevelComplete.visible = false
	$LevelComplete/AnimationPlayer.stop(true)
	$LevelComplete/LevelComplete.frame = 0
	levelComplete = false
	

func save_this():
	var dict = {
		"levelComplete" : levelComplete
	}
	for l in levels:
		print(l.name)
		dict[l.name] = l.save_this()
		
	return dict
	
func load_this(dict):
	for l in levels:
		l.load_this(dict[l.name])
	levelComplete = dict["levelComplete"]


func _on_Control_gui_input(event):
	if event is InputEventMouseButton :
		if event.button_index == 1 and event.is_pressed():
			$Lvlend.visible = false


