extends Node

var outroClass = preload("res://Szenen/Avatar/Outro.tscn")
var outroScene
var introClass = preload("res://Szenen/Avatar/Intro.tscn")
var introScene
var MainMenuClass = preload("res://Szenen/GUI/MainMenu.tscn")
var AvatarClass = preload("res://Szenen/Avatar/Avatar.tscn")
var HouseClass = preload("res://Szenen/GUI/HouseScene.tscn")
var AboutClass

var LevelViewClass1 = preload("res://Szenen/Levels/LevelView1.tscn")
var LevelViewClass2 = preload("res://Szenen/Levels/LevelView2.tscn")
var LevelViewClass3 = preload("res://Szenen/Levels/LevelView3.tscn")
var LevelViewClass4 = preload("res://Szenen/Levels/LevelView4.tscn")
var BookSceneClass  = preload("res://Szenen/EG/WoZi.tscn")

var Kapitel1Class = preload("res://Szenen/Levels/Kapitel1.tscn")
var Kapitel2Class = preload("res://Szenen/Levels/Kapitel2.tscn")
var Kapitel3Class = preload("res://Szenen/Levels/Kapitel3.tscn")
var Kapitel4Class = preload("res://Szenen/Levels/Kapitel4.tscn")

var AufgabenViewClass1 = preload("res://Szenen/Levels/AufgabenView1.tscn")
var AufgabenViewClass2 = preload("res://Szenen/Levels/AufgabenView2.tscn")
var AufgabenViewClass3 = preload("res://Szenen/Levels/AufgabenView3.tscn")
var AufgabenViewClass4 = preload("res://Szenen/Levels/AufgabenView4.tscn")


var MainMenu = MainMenuClass.instance()
var Avatar 
var House : House = HouseClass.instance()
var About


var BookScene : BookRoom


var LvlView # aktuelle kapitel  experimente
var AufgabenView : Aufgabenview # aktuelle kapitel aufgaben

var LvlView1 # kapitel 1 experimente
var LvlView2 # kapitel 2 experimente
var LvlView3 # kapitel 3 experimente
var LvlView4 # kapitel 4 experimente

var AufgabenView1 : Aufgabenview
var AufgabenView2 :Aufgabenview
var AufgabenView3 :Aufgabenview
var AufgabenView4 :Aufgabenview

var Kapitel1 
var Kapitel2
var Kapitel3
var Kapitel4
var allChapters = []

var currentChapter : Kapitel  # aktuelle kapitel experiment

var currentChapterIndex = 0 
var currentChapterLevel = 0 

var allAufgabenViews = []
var allLevelViews = []

var freeExpClass = load("res://Szenen/DG/FreiesExp.tscn")
var freeExpLvl

var firsteg = load("res://Grafik/Assets/Haus/ug_room_dark.png")
var firstog = load("res://Grafik/Assets/Haus/eg_room_dark.png")
var firstdg = load("res://Grafik/Assets/Haus/dg_room_dark.png")

func _ready():
	instancing()
	
func instancing():
	introScene = introClass.instance()
	freeExpLvl = freeExpClass.instance()
	BookScene =  BookSceneClass.instance()
	BookScene.ownInit()
	LvlView1 = LevelViewClass1.instance()
	LvlView1.ownInit()
	LvlView = LvlView1 #aktuelle auf 1 sezten

	LvlView2 = LevelViewClass2.instance()
	LvlView2.ownInit()
	LvlView3 = LevelViewClass3.instance()
	LvlView3.ownInit()
	LvlView4 = LevelViewClass4.instance()
	LvlView4.ownInit()

	allLevelViews.append(LvlView1)
	allLevelViews.append(LvlView2)
	allLevelViews.append(LvlView3)
	allLevelViews.append(LvlView4)


	Kapitel1 = Kapitel1Class.instance()
	currentChapter = Kapitel1

	Kapitel2 = Kapitel2Class.instance()
	Kapitel3 = Kapitel3Class.instance()
	Kapitel4 = Kapitel4Class.instance()
	Kapitel1.loadLevels()
	Kapitel2.loadLevels()
	Kapitel3.loadLevels()
	Kapitel4.loadLevels()
	allChapters.append(Kapitel1)
	allChapters.append(Kapitel2)
	allChapters.append(Kapitel3)
	allChapters.append(Kapitel4)


	AufgabenView1 = AufgabenViewClass1.instance()
	AufgabenView1.my_init()
	AufgabenView = AufgabenView1

	AufgabenView2 = AufgabenViewClass2.instance()
	AufgabenView2.my_init()
	AufgabenView3 = AufgabenViewClass3.instance()
	AufgabenView3.my_init()
	AufgabenView4 = AufgabenViewClass4.instance()
	AufgabenView4.my_init()
	allAufgabenViews.append(AufgabenView1)
	allAufgabenViews.append(AufgabenView2)
	allAufgabenViews.append(AufgabenView3)
	allAufgabenViews.append(AufgabenView4)

	Avatar = AvatarClass.instance()
	Avatar.own_init()

	House.ownInit()
	outroScene = outroClass.instance()
	
	
func changeLevel(level):
	currentChapterIndex = level
	currentChapterLevel = 0

	currentChapter = allChapters[currentChapterIndex]
	LvlView = allLevelViews[currentChapterIndex]
	AufgabenView = allAufgabenViews[currentChapterIndex]
	
	
	
func reset_all_scenes():

		
	# Free the previous instances
	introScene.queue_free()
	freeExpLvl.queue_free()
	BookScene.queue_free()
	LvlView1.queue_free()
	LvlView2.queue_free()
	LvlView3.queue_free()
	LvlView4.queue_free()
	
	# Free the previous Avatar instance
	if Avatar:
		Avatar.queue_free()
	if House.has_node("Avatar"):
		House.remove_child(Avatar)
	for chapter in allChapters:
		chapter.queue_free()
	for aufgabenView in allAufgabenViews:
		aufgabenView.queue_free()
	if House.has_node("CompositeSprites"):
		House.remove_child(House.get_node("CompositeSprites"))
#	if House.has_node("Tips"):
#		House.get_node("Tips").texts(0)
	

	# Clear the arrays
	allLevelViews.clear()
	allChapters.clear()
	allAufgabenViews.clear()
	Myglobals.playtime = 0
	Myglobals.progressInfo.get_node("ProgressBar").value = 0
	
	currentChapterIndex = 0 
	currentChapterLevel = 0
	House.get_node("KapitelInfo/Title").text = "Kapitel " + str(GlobalScenes.currentChapterIndex+1)
	var node = House.get_node("KapitelInfo/Arrows/AmpereGift")
	if node:
	# Do something with the node
		pass
	else: print("Node not found")
	House.get_node("KapitelInfo/Arrows/VoltmeterUnlocked").visible = false
	House.get_node("KapitelInfo/Arrows/ResistorUnlocked").visible = false
#	House.get_node("Tips").setChapterText(1)
#	House.get_node("Wohnzimmer").texture = firsteg
#	House.get_node("KinderZimmer/Kinderzimmer").texture = firstog
#	House.get_node("Dachboden").texture = firstdg
#	House.get_node("Wohnzimmer/StairIcon1").visible = false
#	House.get_node("KinderZimmer/Kinderzimmer/StairIcon").visible = false
#	House.get_node("KinderZimmer/Kinderzimmer/StairIcon2").visible = false
#	House.get_node("Dachboden/StairIcon").visible = false
#	Myglobals.tutorial_finished = false
	House.ownInit()
	Myglobals.chaptersUnlocked = 0
	
	House.get_node("Tips").nextText()
	
	
	instancing()
	
