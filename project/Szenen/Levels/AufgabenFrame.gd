extends Node2D

class_name LevelListe

export (Array, PackedScene) var tasks = []
signal aufgabenComplete


func _ready():
	pass
	
func own_init():
	tasks = []
	for a in get_node("AufgabenFrame/ScrollContainer/Control").get_children():
		tasks.append(false)
	$Table.own_init()

func _on_Control_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			if $AufgabenFrame.position.x ==0 :
				$AufgabenFrame/AnimationPlayer.play("aufgSlideOut")
			else:
				$AufgabenFrame/AnimationPlayer.play_backwards("aufgSlideOut")

func taskCompleted(index):
	SoundFx.correctsound()
	print("task complete")
	tasks[index] = true
	for t in tasks:
		if !t:
			return
	emit_signal("aufgabenComplete")

func connectTableAufgaben():
	$Table.connectTable()
	for a in get_node("AufgabenFrame/ScrollContainer/Control").get_children():
		if a is ExperimentAufgabe:
			a.connect("completed",self,"taskCompleted")
			Myglobals.electricSolver.connect("closedCircuit",a,"onClose",[],1)
			Myglobals.electricSolver.connect("closedGraphPart",a,"onClosedGraph",[],1)
			

func disconnectTableAufgaben():
	for a in get_node("AufgabenFrame/ScrollContainer/Control").get_children():
		if a is ExperimentAufgabe:
			a.disconnect("completed",self,"taskCompleted")
			Myglobals.electricSolver.disconnect("closedCircuit",a,"onClose")
			Myglobals.electricSolver.disconnect("closedGraphPart",a,"onClosedGraph")
			
func _on_AnimationPlayer_animation_finished(_anim_name):
	if $AufgabenFrame.position.x <0 :
		$AufgabenFrame/ScrollContainer.visible =false
		
# enter from levelview
func onLoad():
	$Table.connectTable()

func _on_zurueck_clicked(event):
	if event is InputEventMouseButton :
		if event.button_index == 1 and event.is_pressed():	
			Myglobals.gotoScene(GlobalScenes.currentChapter.lastScene)

func save_this():
	var mods = []
	var edgs = []
	var knds = []
	

	
	for m in $Table/Modules/YSort.get_children():
		mods.append(m.save_this())
	
	for e in $Table/Edges.get_children():
		edgs.append(e.save_this())
		
	for k in $Table/Knodes.get_children():
		knds.append(k.save_this())
	
	var levelTasks = []
	for t in tasks:
		levelTasks.append(t)
	
	var dict = {
		SaveNames.e_Base : edgs,
		SaveNames.m_Base : mods,
		SaveNames.k_Base : knds,
		SaveNames.Task_completed : levelTasks
	}
	
	return dict

func load_this(dict):
	var modules_loaded = dict[SaveNames.m_Base]
	var knodes_loaded = dict[SaveNames.k_Base]
	var edges_loaded = dict[SaveNames.e_Base]
	var modulesBase = $Table/Modules/YSort
	var edgesBase = $Table/Edges
	var knodesBase = $Table/Knodes
	
	for m in modulesBase.get_children():
		modulesBase.remove_child(m)
	for k in knodesBase.get_children():
		knodesBase.remove_child(k)
	for e in edgesBase.get_children():
		edgesBase.remove_child(e)
	
	
	
	for m in modules_loaded:
		var t = m[SaveNames.save_type]
		var m_instance
		if t == "Battery":
			m_instance = preload("res://Szenen/DG/Battery.tscn").instance()
		elif t == "Lamp":
			m_instance = preload("res://Szenen/DG/Lampe.tscn").instance()
		elif t == "Ampermeter":
			m_instance = preload("res://Szenen/DG/Ampermeter.tscn").instance()
		elif t == "Voltmeter":
			m_instance = preload("res://Szenen/DG/InvertedAmpermeter.tscn").instance()
		elif t == "Resistor":
			m_instance = preload("res://Szenen/DG/Resistor.tscn").instance()
			
			
		m_instance.position.x = m[SaveNames.save_posX]
		m_instance.position.y = m[SaveNames.save_posY]
		modulesBase.add_child(m_instance)
		
		
	for k in knodes_loaded:
		var new_k = preload("res://Szenen/DG/Knode.tscn").instance()
		knodesBase.add_child(new_k)
		new_k.position.x = k[SaveNames.save_posX]
		new_k.position.y = k[SaveNames.save_posY]
		
	for e in edges_loaded:
		var new_e = preload("res://Szenen/DG/EdgeLine.tscn").instance()
		edgesBase.add_child(new_e)
		new_e.position.x = e[SaveNames.save_posX]
		new_e.position.y = e[SaveNames.save_posY]
	
	for e in edges_loaded:
		for i in e[SaveNames.e_connectedKnodes]:
			var kn = knodesBase.get_child(i)
			edgesBase.get_child(e[SaveNames.save_posInPar]).connectedKnodes.append(kn)
			
		if e[SaveNames.e_moduleOnEdge] != -1:
			edgesBase.get_child(e[SaveNames.save_posInPar]).moduleOnEdge = modulesBase.get_child(e[SaveNames.e_moduleOnEdge])
		if e[SaveNames.e_leftKnode] != -1:
			edgesBase.get_child(e[SaveNames.save_posInPar]).leftknode = knodesBase.get_child(e[SaveNames.e_leftKnode])
		if e[SaveNames.e_rightKnode] != -1:
			edgesBase.get_child(e[SaveNames.save_posInPar]).rightknode = knodesBase.get_child(e[SaveNames.e_rightKnode])
			
		edgesBase.get_child(e[SaveNames.save_posInPar]).isCable = e[SaveNames.e_isCable]
		edgesBase.get_child(e[SaveNames.save_posInPar]).isLockedDirection = e[SaveNames.e_isLockedDirection]
		edgesBase.get_child(e[SaveNames.save_posInPar]).midx = e[SaveNames.e_midx]
		edgesBase.get_child(e[SaveNames.save_posInPar]).midy = e[SaveNames.e_midy]
		edgesBase.get_child(e[SaveNames.save_posInPar]).originalR = e[SaveNames.e_originalR]
		edgesBase.get_child(e[SaveNames.save_posInPar]).resistance = e[SaveNames.e_resistance]
		edgesBase.get_child(e[SaveNames.save_posInPar]).voltage =  e[SaveNames.e_voltage]
		
	for m in modules_loaded:
		if m[SaveNames.m_leftKnode] != -1:
			modulesBase.get_child(m[SaveNames.save_posInPar]).leftKnode = knodesBase.get_child(m[SaveNames.m_leftKnode])
		if m[SaveNames.m_rightKnode] != -1:
			modulesBase.get_child(m[SaveNames.save_posInPar]).rightKnode =knodesBase.get_child( m[SaveNames.m_rightKnode])
		
		var e = edgesBase.get_child(m[SaveNames.m_myEdge])
		modulesBase.get_child(m[SaveNames.save_posInPar]).myEdge = e
		
		modulesBase.get_child(m[SaveNames.save_posInPar]).isVertical = m[SaveNames.m_isVertical] 
		modulesBase.get_child(m[SaveNames.save_posInPar]).turned = m[SaveNames.m_turned]
		
	for k in knodes_loaded:
		for kn in k[SaveNames.k_neighbors]:
			knodesBase.get_child(k[SaveNames.save_posInPar]).neighbors.append(knodesBase.get_child(kn))
	
	tasks = dict[SaveNames.Task_completed]
	var i = 0
	for t in tasks:
		if t:
			$AufgabenFrame/ScrollContainer/Control.get_child(i).get_node("Aufgabe").pressed = true
			$AufgabenFrame/ScrollContainer/Control.get_child(i).levelComplete = t
		i +=1


func _on_CloseWarning_gui_input(event):
	if event is InputEventMouseButton :
		if event.is_pressed():
			$warning.visible = false


func _on_ResetCircuit_gui_input(event):
	if event is InputEventMouseButton :
		if event.is_pressed():
			for k in $Table/Modules/YSort.get_children():
				k.delete_module()
			for k in $Table/Edges.get_children():
				k.deleteMe()
			$warning.visible = false
		
func _on_ShowReset_gui_input(event):
	if event is InputEventMouseButton :
		if event.is_pressed():
			$warning.visible = true

func set_Aufgaben(aufgaben):
	$AufgabenFrame/AusprobierenLabel.visible = false
	for c in $AufgabenFrame/ScrollContainer/Control.get_children():
		$AufgabenFrame/ScrollContainer/Control.remove_child(c)
		
	for a in aufgaben:
		var sc = load("res://Szenen/InfoPic.tscn").instance()
		sc.add_child(a)
		
		a.scale = Vector2(0.7,0.7)
		a.position = Vector2(0,0)
		
		a.position.x = a.get_rect().size.x*0.7/2 + 20
		a.position.y = a.get_rect().size.y*0.7/2 +5
		$AufgabenFrame/ScrollContainer/Control.add_child(sc)
		
func remove_Aufgaben():
	$AufgabenFrame/AusprobierenLabel.visible = true
	for c in $AufgabenFrame/ScrollContainer/Control.get_children():
		$AufgabenFrame/ScrollContainer/Control.remove_child(c)


func _on_showTips_gui_input(event):
	if event is InputEventMouseButton :
		if event.is_pressed():
#			$showTips.visible = false
			$TipsTable.visible = true





func _on_ResetCircuit_mouse_entered():
	get_node("warning/Label2").add_color_override("font_color", Color("#39c031"))
	

func _on_ResetCircuit_mouse_exited():
	get_node("warning/Label2").add_color_override("font_color", Color("#00303a"))
