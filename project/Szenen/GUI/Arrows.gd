extends Node2D


#chapter 1
var c1ugRoom = load("res://Grafik/Assets/Haus/ug_room_dark.png")
var c1egRoom2 = load("res://Grafik/Assets/Haus/eg_room2_dark.png")
var c1egRoom = load("res://Grafik/Assets/Haus/eg_room_dark.png")
var c1dgRoom = load("res://Grafik/Assets/Haus/dg_room_dark.png")


#chapter 2
var c2ugRoom = load("res://Grafik/Assets/Haus/ug_room_2.png")
var c2egRoom = load("res://Grafik/Assets/Haus/eg_room2_2.png")
var c2egRoom2 = load("res://Grafik/Assets/Haus/eg_room_2.png")
var c2dgRoom = load("res://Grafik/Assets/Haus/dg_room_2.png")

#chapter 3
var c3ugRoom = load("res://Grafik/Assets/Haus/ug_room_3.png")
var c3egRoom = load("res://Grafik/Assets/Haus/eg_room2_3.png")
var c3egRoom2 = load("res://Grafik/Assets/Haus/eg_room_3.png")
var c3dgRoom = load("res://Grafik/Assets/Haus/dg_room_3.png")

#chapter4
var c4ugRoom = load("res://Grafik/Assets/Haus/ug_room_4.png")
var c4egRoom = load("res://Grafik/Assets/Haus/eg_room2_4.png")
var c4egRoom2 = load("res://Grafik/Assets/Haus/eg_room_4.png")
var c4dgRoom = load("res://Grafik/Assets/Haus/dg_room_4.png")

#chapter5
var ugRoom = load("res://Grafik/Assets/Haus/ug_room.png")
var egRoom = load("res://Grafik/Assets/Haus/eg_room2.png")
var egRoom2 = load("res://Grafik/Assets/Haus/eg_room.png")
var dgRoom = load("res://Grafik/Assets/Haus/dg_room.png")


var gameOverVisible = false

func checkArrowActive():
	# ------- book
	var page
	if GlobalScenes.BookScene.geleseneSeiten == 0:
		page = 0
	else:
		page = GlobalScenes.BookScene.geleseneSeiten
	get_parent().get_node("CounterBuchseiten").text =str(page)

	# ------- experiments
	var experdone = false
	var cLvls = 0
	
	if GlobalScenes.currentChapterIndex <= 3:
		for l in GlobalScenes.allLevelViews[GlobalScenes.currentChapterIndex].levelPreviews:
			if l.completed:
				cLvls +=1
		if cLvls == GlobalScenes.LvlView.levelPreviews.size():
			experdone = true
	
	get_parent().get_node("CounteAufgaben").text = str(cLvls) + " / " + str(GlobalScenes.LvlView.levelPreviews.size())
	
	
	# ------- aufgaben
	var aufgdone = false
	
	var currChapterAufgPreviews = GlobalScenes.AufgabenView.previewslvl
	var cAufg = 0
	
	for l in currChapterAufgPreviews:
		if l.completed:
			cAufg +=1
		if cAufg == currChapterAufgPreviews.size():
			aufgdone = true
			
	
	var aufgLimit = str(cAufg) + " / "+str(GlobalScenes.AufgabenView.aufgabenKapitel.size())
	get_parent().get_node("CounterUmfragen").text = aufgLimit
			
	
	var unlocked = false
	if aufgdone and experdone:
		unlocked = true
		if GlobalScenes.currentChapterIndex == Myglobals.chaptersUnlocked:
				newUnlockedLvl()
				return
				
	
	if GlobalScenes.currentChapterIndex < 3:
		if (unlocked):
			$ArrowRight/active.visible = true
		else:
			$ArrowRight/active.visible = false
			
		
	if GlobalScenes.currentChapterIndex >=3:
		$ArrowRight/active.visible = false
		$ArrowRight/mouseover.visible = false
	if GlobalScenes.currentChapterIndex <= 0:
		$ArrowLeft/active.visible = false
		$ArrowLeft/mouseover.visible = false
	else:
		$ArrowLeft/active.visible = true
	return unlocked


func _on_ControlRight_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			var unlocked = checkArrowActive()
			if GlobalScenes.currentChapterIndex < 3:
				if (unlocked):
					get_parent().get_parent().changeLvl(GlobalScenes.currentChapterIndex + 1 )
					checkArrowActive()
				


func _on_ControlLeft_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			if GlobalScenes.currentChapterIndex >0:
				get_parent().get_parent().changeLvl(GlobalScenes.currentChapterIndex - 1)
				checkArrowActive()

# 4 -> chapter 5
func newUnlockedLvl():
	Myglobals.chaptersUnlocked +=1
	Saver.sendSave()
	get_parent().get_parent().get_node("Tips").setChapterText(4)
	get_parent().get_parent().get_node("Wohnzimmer").texture = ugRoom
	get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer").texture = egRoom
	get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer2").texture = egRoom2
	get_parent().get_parent().get_node("Dachboden").texture = dgRoom
	if Myglobals.chaptersUnlocked<5:
		$geschafft/KapitelGschafft.play("KapitelGeschafftKreis")
#		$Kapitelabschluss/AnimationPlayer.play("KapitelGeschafftKreis")
		SoundFx.chaptersound()
		if Myglobals.chaptersUnlocked == 4:
			Myglobals.progressInfo.get_node("ProgressBar").value = 100
		
		
			return
	else:
		return
		
	if Myglobals.chaptersUnlocked ==0:
		get_parent().get_parent().get_node("Tips").texts(0)
		get_parent().get_parent().get_node("Wohnzimmer").texture = c1ugRoom
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer").texture = c1egRoom
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer2").texture = c1egRoom2
		get_parent().get_parent().get_node("Dachboden").texture = c1dgRoom
		
		get_parent().get_parent().get_node("Wohnzimmer/StairIcon1").visible = true
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer/StairIcon").visible = true
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer/StairIcon2").visible = true
		get_parent().get_parent().get_node("Dachboden/StairIcon").visible = true
	
	if Myglobals.chaptersUnlocked ==1:
		get_parent().get_parent().get_node("Tips").setChapterText(1)
		get_parent().get_parent().get_node("Wohnzimmer").texture = c2ugRoom
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer").texture = c2egRoom
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer2").texture = c2egRoom2
		get_parent().get_parent().get_node("Dachboden").texture = c2dgRoom
		
		get_parent().get_parent().get_node("Wohnzimmer/StairIcon1").visible = false
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer/StairIcon").visible = false
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer/StairIcon2").visible = false
		get_parent().get_parent().get_node("Dachboden/StairIcon").visible = false

		
	if Myglobals.chaptersUnlocked ==2:
		get_parent().get_parent().get_node("Tips").setChapterText(2)
		get_parent().get_parent().get_node("Wohnzimmer").texture = c3ugRoom
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer").texture = c3egRoom
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer2").texture = c3egRoom2
		get_parent().get_parent().get_node("Dachboden").texture = c3dgRoom
		
	
	if Myglobals.chaptersUnlocked ==3:
		get_parent().get_parent().get_node("Tips").setChapterText(3)
		get_parent().get_parent().get_node("Wohnzimmer").texture = c4ugRoom
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer").texture = c4egRoom
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer2").texture = c4egRoom2
		get_parent().get_parent().get_node("Dachboden").texture = c4dgRoom
		get_parent().get_parent().get_node("ColorRect").color.v = 0.4
	
	if Myglobals.chaptersUnlocked ==4:
		get_parent().get_parent().get_node("Tips").setChapterText(4)
		get_parent().get_parent().get_node("Wohnzimmer").texture = ugRoom
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer").texture = egRoom
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer2").texture = egRoom2
		get_parent().get_parent().get_node("Dachboden").texture = dgRoom
	goToNextChapter()
	
	

func goToNextChapter():
	if GlobalScenes.currentChapterIndex < 3:
			get_parent().get_parent().changeLvl(GlobalScenes.currentChapterIndex + 1 )
			$ArrowRight/active.visible = false
			checkArrowActive()
			
			

func _on_KapitelGschafft_animation_finished(_anim_name):
	if Myglobals.chaptersUnlocked ==1:
		$GameOver.visible = true
		$GameOver/Outro/roof_out/cutsceneAvatar.own_init()
		var gameOverAnimation = $GameOver.get_node("AnimationPlayer")
		gameOverAnimation.play("GameOver")
		yield(gameOverAnimation, "animation_finished") 
		$ResistorUnlocked.visible = true
		$ResistorUnlocked.get_node("AnimationPlayer").play("KinderAufgOriginal")
		
	else:
		get_parent().get_parent().get_node("Badges").checkQueue()
	
	
func loadUnlockedLvl():
		
	if Myglobals.chaptersUnlocked ==0:
		get_parent().get_parent().get_node("Tips").setChapterText(0)
		get_parent().get_parent().get_node("Wohnzimmer").texture = c1ugRoom
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer").texture = c1egRoom2
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer2").texture = c1egRoom
		get_parent().get_parent().get_node("Dachboden").texture = c1dgRoom

	if Myglobals.chaptersUnlocked ==1:
		get_parent().get_parent().get_node("Tips").setChapterText(1)
		get_parent().get_parent().get_node("Wohnzimmer").texture = c2ugRoom
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer").texture = c2egRoom
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer2").texture = c2egRoom2
		get_parent().get_parent().get_node("Dachboden").texture = c2dgRoom
		
	if Myglobals.chaptersUnlocked ==2:
		get_parent().get_parent().get_node("Tips").setChapterText(2)
		get_parent().get_parent().get_node("Wohnzimmer").texture = c3ugRoom
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer").texture = c3egRoom
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer2").texture = c3egRoom2
		get_parent().get_parent().get_node("Dachboden").texture = c3dgRoom
	
	if Myglobals.chaptersUnlocked ==3:
		get_parent().get_parent().get_node("Tips").setChapterText(3)
		get_parent().get_parent().get_node("Wohnzimmer").texture = c4ugRoom
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer").texture = c4egRoom
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer2").texture = c4egRoom2
		get_parent().get_parent().get_node("Dachboden").texture = c4dgRoom
		get_parent().get_parent().get_node("ColorRect").color.v = 0.4
	
	if Myglobals.chaptersUnlocked ==4:
		get_parent().get_parent().get_node("Tips").setChapterText(4)
		get_parent().get_parent().get_node("Wohnzimmer").texture = ugRoom
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer").texture = egRoom
		get_parent().get_parent().get_node("KinderZimmer/Kinderzimmer2").texture = egRoom2
		get_parent().get_parent().get_node("Dachboden").texture = dgRoom
	
func _input(event):
	if gameOverVisible:
		if event is InputEventMouseButton:
			if event.is_pressed() and event.button_index==1:
				gameOverVisible = false
				$GameOver.visible = false
				get_tree().set_input_as_handled() 


func _on_ControlLeft_mouse_entered():
	if $ArrowLeft/active.visible:
		$ArrowLeft/mouseover.visible = true
	else:
		$ArrowLeft/mouseover.visible = false

func _on_ControlLeft_mouse_exited():
	if $ArrowLeft/active.visible:
		$ArrowLeft/mouseover.visible = false
	else:
		$ArrowLeft/mouseover.visible = false

func _on_ControlRight_mouse_entered():
	if $ArrowRight/active.visible:
		$ArrowRight/mouseover.visible = true
	else:
		$ArrowRight/mouseover.visible = false
func _on_ControlRight_mouse_exited():
	if $ArrowRight/active.visible:
		$ArrowRight/mouseover.visible = false
	else:
		$ArrowRight/mouseover.visible = false


func _on_AnimationPlayer_animation_finished(_anim_name):
	get_parent().get_parent().get_node("Badges").checkQueue()
	gameOverVisible = true
