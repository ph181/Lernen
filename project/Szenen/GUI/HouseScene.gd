extends Node2D

class_name House
enum scene_rooms  {KinderZimmer,WohnZimmer, Dachboden}
var room_type = scene_rooms.WohnZimmer
# Called when the node enters the scene tree for the first time.

func _ready():
	GlobalScenes.House = self
	$AnimationPlayer.stop(true)
	$AnimationPlayer.set_assigned_animation("ugToEg")
	$AnimationPlayer.advance(0)


	
func ownInit():

	$KapitelInfo.ownInit()
	$Badges.own_init()
	
func _input(event):
	if event is InputEventMouseMotion:
		if  Myglobals.chaptersUnlocked >2:
			$Light2D.enabled = false;
			$Light2D.enabled = false;
			$Light2D.visible=false
		else:
			$Light2D.position = event.position
	if event is InputEventKey and event.unicode == KEY_1 and event.is_pressed():
		$KapitelInfo/Arrows.newUnlockedLvl()
		
	if event.is_action_pressed("ui_cancel") and Myglobals.tutorial_finished:
		if Myglobals.currentScene != GlobalScenes.MainMenu:
			if $Badges.visible:
				$Badges.visible = false
	
	


func _on_AreaWoZi_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and Myglobals.tutorial_finished:
		if event.is_pressed() and event.button_index == 1:
			if room_type == scene_rooms.WohnZimmer:
				SoundFx.stairssound()
				$AnimationPlayer.play("ugToEg")
				setRoomSate(scene_rooms.KinderZimmer)
			elif room_type == scene_rooms.KinderZimmer:
				setRoomSate(scene_rooms.WohnZimmer)
				$AnimationPlayer.play_backwards("ugToEg")

			

func _on_AreaKiZi_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and Myglobals.tutorial_finished:
		if event.is_pressed() and event.button_index == 1:
			if room_type == scene_rooms.Dachboden:
				setRoomSate(scene_rooms.KinderZimmer )
				SoundFx.stairssound()
				$AnimationPlayer.play_backwards("egToDg")
				
			elif room_type == scene_rooms.KinderZimmer:
				SoundFx.stairssound()
				$AnimationPlayer.play("egToDg")
				setRoomSate(scene_rooms.Dachboden)
				
				
func setRoomSate(state ):
	
	var dark = Color("#ff7679")
	var light = Color("#fffdfa")
	$KapitelInfo/InfoLineAufgaben.add_color_override("font_color",dark)
	$KapitelInfo/CounteAufgaben.add_color_override("font_color",dark)
	
	$KapitelInfo/InfoLineBuch.add_color_override("font_color",dark)
	$KapitelInfo/CounterBuchseiten.add_color_override("font_color",dark)
	
	$KapitelInfo/InfoLineUmfragen.add_color_override("font_color",dark)
	$KapitelInfo/CounterUmfragen.add_color_override("font_color",dark)
	
	if state == scene_rooms.WohnZimmer:
		room_type = scene_rooms.WohnZimmer
		$KapitelInfo/InfoLineBuch.add_color_override("font_color",light)
		$KapitelInfo/CounterBuchseiten.add_color_override("font_color",light)
		
	elif state == scene_rooms.KinderZimmer:
		room_type = scene_rooms.KinderZimmer
		$KapitelInfo/InfoLineUmfragen.add_color_override("font_color",light)
		$KapitelInfo/CounterUmfragen.add_color_override("font_color",light)
		
	elif state == scene_rooms.Dachboden:
		room_type = scene_rooms.Dachboden
		$KapitelInfo/InfoLineAufgaben.add_color_override("font_color",light)
		$KapitelInfo/CounteAufgaben.add_color_override("font_color",light)

func _on_TransistDg_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and Myglobals.tutorial_finished:
		if event.is_pressed() and event.button_index == 1:
			$Dachboden/rooftransition/rooftransition.play("roofenter")
			SoundFx.roofsound()
			$Timer2.start()

			
func _on_Timer2_timeout():
	Myglobals.gotoScene(GlobalScenes.LvlView)

func _on_Down_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and Myglobals.tutorial_finished:
		if event.is_pressed() and event.button_index == 1:
			SoundFx.stairssound()
			$AnimationPlayer.play_backwards("ugToEg")
			setRoomSate(scene_rooms.WohnZimmer)
			
			

func _on_TransistBook_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and Myglobals.tutorial_finished:
		if event.is_pressed() and event.button_index == 1:
			SoundFx.livingsound()
			Myglobals.gotoScene(GlobalScenes.BookScene)

func enterScene(_lastscene):
#	Myglobals.game.checkFlow()
#	MyFlowTimer.startTimer()
	$KapitelInfo/Arrows.checkArrowActive()
	$Wohnzimmer/bookIcon/AnimationPlayer.play("loop")
	$KinderZimmer/Kinderzimmer/taskIcon/AnimationPlayer.play("looptable")
	$Dachboden/iconExp/AnimationPlayer.play("loopExp")
	$Wohnzimmer/StairIcon1/AnimationPlayer.play("loop")
	$Wohnzimmer/badgeicon/AnimationPlayer.play("loop")
	$KinderZimmer/Kinderzimmer/StairIcon/AnimationPlayer.play("looptable")
	$KinderZimmer/Kinderzimmer/StairIcon2/AnimationPlayer.play("looptable")
	$Dachboden/StairIcon/AnimationPlayer.play("loopExp")
	var dark = Color("#ff7679")
	var light = Color("#fffdfa")
	$KapitelInfo/InfoLineAufgaben.add_color_override("font_color",dark)
	$KapitelInfo/CounteAufgaben.add_color_override("font_color",dark)
	
	$KapitelInfo/InfoLineBuch.add_color_override("font_color",dark)
	$KapitelInfo/CounterBuchseiten.add_color_override("font_color",dark)
	
	$KapitelInfo/InfoLineUmfragen.add_color_override("font_color",dark)
	$KapitelInfo/CounterUmfragen.add_color_override("font_color",dark)
	$Light2D.position.x = 200
	$Light2D.position.y = 660
	$KinderZimmer/transistion.visible = false
	$Dachboden/rooftransition.visible = false
	
	
	if room_type == scene_rooms.WohnZimmer:
		
		$KapitelInfo/InfoLineBuch.add_color_override("font_color",light)
		$KapitelInfo/CounterBuchseiten.add_color_override("font_color",light)
		
	elif room_type == scene_rooms.KinderZimmer:
		
		$KapitelInfo/InfoLineUmfragen.add_color_override("font_color",light)
		$KapitelInfo/CounterUmfragen.add_color_override("font_color",light)
		
	elif room_type == scene_rooms.Dachboden:
		
		$KapitelInfo/InfoLineAufgaben.add_color_override("font_color",light)
		$KapitelInfo/CounteAufgaben.add_color_override("font_color",light)
	
	
	$Badges.checkQueue()
	
	
	
	if !Saver.isloading:
		Saver.save_game()	
	
func changeLvl(level):
	GlobalScenes.changeLevel(level)
	$KapitelInfo/Title.text = "Kapitel " + str(GlobalScenes.currentChapterIndex+1)
	
func sayConnectedPlayers(me ):
	var chat = GlobalScenes.House.get_node("Chat/Sprite/ItemList/VBoxContainer")

	var chatmsg = load("res://Szenen/chatmsg.tscn").instance()

	if !me:
		chatmsg.add_color_override("font_color", Color("#ff7679"))
	else:
		chatmsg.add_color_override("font_color", Color("#272c68"))
	chatmsg.text = "Connected Players:" +str( Saver.conectedPlayers)

	chat.add_child(chatmsg)

func _on_Aufgaben_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and Myglobals.tutorial_finished:
		if event.is_pressed() and event.button_index == 1:
			$KinderZimmer/transistion/Kindertransistion.play("KinderzimmerEntry")
			SoundFx.childsound()
			$Timer.start()

# Stellen Sie sicher, dass Sie einen Timer namens "Timer" in Ihrer Szene haben
func _on_Timer_timeout():
	Myglobals.gotoScene(GlobalScenes.AufgabenView)

			
func load_this(dict):
	$Tips.load_this()
	Myglobals.tutorial_finished = true
	$KapitelInfo.ownInit()
#	MyFlowTimer.startTimer()
	$Badges.load_this(dict)
	
func _on_Control_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			SoundFx.buttonsound()
			Myglobals.game.get_node("gg/EscMenu").visible = true


func _on_Button_pressed():
	Saver.sMsg($Chat/Sprite/LineEdit.text)
	$Chat/Sprite/LineEdit.text = ""


func _on_LineEdit_text_entered(_new_text):
	Saver.sMsg($Chat/Sprite/LineEdit.text)
	$Chat/Sprite/LineEdit.text = ""

func save_this():
	return $Badges.save_this()


func _on_BadgesView_mouse_entered():
	Input.set_default_cursor_shape(2)
	$Wohnzimmer/Signals/BadgesView/CollisionPolygon2D/Sprite.visible = true


func _on_BadgesView_mouse_exited():
	Input.set_default_cursor_shape(0)
	$Wohnzimmer/Signals/BadgesView/CollisionPolygon2D/Sprite.visible = false


func _on_closebadge_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			$Badges.visible = false

func reset():
	# Additional reset logic for House if needed
	# ...

	# Load the initial state or perform any setup
	ownInit()


func _on_Control_mouse_entered():
	$setting/ColorRect.scale = Vector2(1.1,1.1)


func _on_Control_mouse_exited():
	$setting/ColorRect.scale = Vector2(1,1)


