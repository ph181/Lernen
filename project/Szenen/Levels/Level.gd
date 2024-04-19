extends Node2D


var lvl1auf1class = load("res://Szenen/Levels/LvlListe1.tscn")
var levelComplete = false
var currentLevel = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalScenes.Level = self
	$CurrentAufgabe.get_child(0).connect("aufgabenComplete",self,"_on_AufgabenListe_aufgabenComplete")

func _process(delta):
	if levelComplete:
		if $LevelComplete/AnimationPlayer.is_playing() == false:
			pass
			


func levelCompleted():
	if !levelComplete:
		$LevelComplete/LevelComplete/Particles2D.emitting = true
		$LevelComplete/AnimationPlayer.play("LevelComplete")
		levelComplete = true
	
		


func _on_AufgabenListe_aufgabenComplete():
	levelCompleted()
#	var oldTask = $AufgabenListe/ScrollContainer/Control.get_child(0)
#	$AufgabenListe/ScrollContainer/Control.remove_child($AufgabenListe/ScrollContainer/Control.get_child(0))
#	$AufgabenDone.add_child(oldTask)
#	if $AufgabenToDo.get_child_count() > 0:
#		var newTask = $AufgabenToDo.get_child(0)
#		newTask.connect("completed",$AufgabenListe,"taskCompleted")
#		Myglobals.electricSolver.connect("closedCircuit",newTask,"onClose")
#
#		$AufgabenToDo.remove_child(newTask)
#		$AufgabenListe/ScrollContainer/Control.add_child(newTask)
#	else:
		


func _on_Continue_gui_input(event):
	if event is InputEventMouseButton :
		if event.button_index == 1 and event.is_pressed():
			var done = $CurrentAufgabe.get_child(0)
			done.disconnect("aufgabenComplete",self,"_on_AufgabenListe_aufgabenComplete")
			done.get_parent().remove_child(done)
			
			var newAufgabe = lvl1auf1class.instance()
			newAufgabe.connect("aufgabenComplete",self,"_on_AufgabenListe_aufgabenComplete")
			$CurrentAufgabe.add_child(newAufgabe)
			currentLevel +=1
			$Lvlend.visible = false
			levelComplete = false
		
func _on_Uebersicht_gui_input(event):
	if event is InputEventMouseButton :
		if event.button_index == 1 and event.is_pressed():
			$Lvlend.visible = false

func _on_AnimationPlayer_animation_finished(anim_name):
	$Lvlend.visible = true
