extends Node2D

class_name MyGame

#var FlowClass = load("res://Szenen/FlowQuestion.tscn")
#var questions =  [  
#"Ich habe bisher alles verstanden und könnte es einer anderen Person erklären.", 
#] 
##var questionsUsed = []
##var waitingflow = []
#var addedQuestions =[]
# Called when the node enters the scene tree for the first time.
func _ready():
	Myglobals.game = self
	Myglobals.currentScene = $gg/currentGameScreen.get_child(0)
	Myglobals.lastScene = $gg/currentGameScreen.get_child(0)
	Myglobals.escMenu = $gg/EscMenu
	$gg/AnimationPlayer.play("fadeInScene")
#	MyFlowTimer.connect("doAction",self,"showFlowQuestion")
#	for q in questions:
#		questionsUsed.append(false)

#
		
func _process(delta):
	Myglobals.playtime += delta
	
	
func _input(event):
	if event.is_action_pressed("ui_cancel") and Myglobals.tutorial_finished:
		if Myglobals.currentScene != GlobalScenes.MainMenu:
			$gg/EscMenu.visible = !$gg/EscMenu.visible
#	if event is InputEventKey:
#		if event.unicode== KEY_S:
			#Saver.sendSave()
#func save_this():
#	var quest = {}
##	for q in range( questionsUsed.size()):
##		quest[q]=questionsUsed[q]
#	return quest
	
#func load_this(quest : Dictionary):
#	for q in quest.keys():
#		questionsUsed[q] = quest[q]
