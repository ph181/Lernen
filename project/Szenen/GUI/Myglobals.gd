extends Node

var modulClass = preload("res://Szenen/DG/Modul.tscn")
var knodeClass = preload("res://Szenen/DG/Knode.tscn")
var lampClass = preload("res://Szenen/DG/Lampe.tscn")
var voltClass = preload("res://Szenen/DG/InvertedAmpermeter.tscn")
var batteryClass = preload("res://Szenen/DG/Battery.tscn")
var edgeClass = preload("res://Szenen/DG/EdgeLine.tscn")
var ampereClass = preload("res://Szenen/DG/Ampermeter.tscn")
var resistorClass = preload("res://Szenen/DG/Resistor.tscn")
var LevelViewClass =  preload("res://Szenen/Levels/LevelView.tscn")

var gameInNewState = true
var allKnodesBase
var allEdgesBase
var allModulesBase
var electricSolver
enum ModulTypes {Battery, Lamp, Ampermeter, Voltmeter, Resistor}

var currentScene
var lastScene
var game : MyGame

var escMenu
var avatarNode : CompositeSpriteAvatar
var tutorial_finished = false
var chaptersUnlocked = 0

var progressInfo

var playtime = 0

var firstRoomEntered=""
var VERSION_NR  = "1.5.1"

var game_finished = false




func _ready():
	pass


func gotoScene(scene):
	if scene is  BookRoom:
		if firstRoomEntered == "":
			firstRoomEntered = "WoZi.tscn"
	
	if scene is Aufgabenview:
		if firstRoomEntered == "":
			firstRoomEntered = "AufgabenView1.tscn"
			
	if scene is LevelView:
		if firstRoomEntered == "":
			firstRoomEntered = "Kapitel1.tscn"
		
	currentScene.get_parent().remove_child(currentScene)
	game.get_node("gg/currentGameScreen").add_child(scene)
	lastScene = currentScene
	currentScene = scene

	
	game.get_node("gg/AnimationPlayer").play("fadeInScene")
	escMenu.visible = false
	if (scene.has_method("enterScene")):
		scene.enterScene(lastScene)

 
func _input(event):
	if event.is_action_pressed("ui_up"):
		print(allModulesBase.get_child_count())
		print(allEdgesBase.get_child_count())
		print(allKnodesBase.get_child_count())

func douplicateModule():
	var new = modulClass.instance()
	return new

func checkCombine(_event, knode):
	for k in Myglobals.allKnodesBase.get_children():
		if abs(k.position.x - knode.position.x)<12 and\
		abs(k.position.y - knode.position.y)<12:
			if k != knode:
				var hasModuleEdge = checkHasModuleEdge(knode)
				if hasModuleEdge != null:
					var xx
					if k.position.x < knode.position.x:
						xx = (k.position.x) -knode.position.x
					else:
						xx = (k.position.x) -knode.position.x
					Myglobals.pullWithEdge(Vector2(xx,k.position.y-knode.position.y),hasModuleEdge )
				var knodeE = []
				var kE = []
				for e in allEdgesBase.get_children():
					if e.connectedKnodes[0]== k or  e.connectedKnodes[1]== k :
						kE.append(e)
					if e.connectedKnodes[0]== knode or  e.connectedKnodes[1]== knode :
						knodeE.append(e)
				for o in kE:
					for d in knodeE:
						if o.connectedKnodes[0] == d.connectedKnodes[0] or\
						o.connectedKnodes[1] == d.connectedKnodes[0]:
							d.connectedKnodes[1].get_node("Warning").visible = true
							return false
						if o.connectedKnodes[1] == d.connectedKnodes[1] or\
						o.connectedKnodes[0] == d.connectedKnodes[1]:
							d.connectedKnodes[0].get_node("Warning").visible = true
							return false
				Myglobals.combine(k,knode)
#				.play()
				return true

func checkHasModuleEdge(knode):
	for e in Myglobals.allEdgesBase.get_children():
		if e.connectedKnodes[0] == knode or e.connectedKnodes[1] == knode:
			if !e.isCable:
				return e
	return null


func combine(original, other):
	for k in allKnodesBase.get_children():
		if k != other:
			for kn in range (k.neighbors.size()-1,-1,-1):
				if k.neighbors[kn] == other:
					k.neighbors.remove(kn)
					k.neighbors.append(original)
					break
				
	for myn in other.neighbors:
		original.neighbors.append(myn)
	
	if other.get_parent( ) !=null:
		other.get_parent().remove_child(other)
		for m in allModulesBase.get_children():

			if m.leftKnode == other:
				m.leftKnode = null
			if m.rightKnode == other:
				m.rightKnode = null
		for e in allEdgesBase.get_children():
			if e.leftknode != null:
				e.leftknode = null
			if e.rightknode != null:
				e.rightknode = null
				
		other.queue_free()
	
	for e in allEdgesBase.get_children():
		if e.connectedKnodes[0] == other:
			e.connectedKnodes[0] = original
		if e.connectedKnodes[1] == other:
			e.connectedKnodes[1] = original
			
			# Play the sound effect
	SoundFx.cablesound()
	electricSolver.updateBase()
		
func cutOutEdge(edge):
	var oldLpos = edge.connectedKnodes[0].position
	var oldRpos = edge.connectedKnodes[1].position
	var leftKnode
	var rightKnode
	
	
	# snap connection in neighbors
	#left knode
	for mnE in range(edge.connectedKnodes[0].neighbors.size()-1,-1,-1):
		if edge.connectedKnodes[0].neighbors[mnE] == edge.connectedKnodes[1]:
			edge.connectedKnodes[0].neighbors.remove(mnE)
	
	#right knode
	for mnE in range(edge.connectedKnodes[1].neighbors.size()-1,-1,-1):
		if edge.connectedKnodes[1].neighbors[mnE] == edge.connectedKnodes[0]:
			edge.connectedKnodes[1].neighbors.remove(mnE)
	
	#todo: delete neighbors pointing to edge.connectedKnodes...
	
	# if old knode is connected to other edges, make new one for current edge
	for e in Myglobals.allEdgesBase.get_children():
		if e != edge:
			if e.connectedKnodes[0] == edge.connectedKnodes[0] or\
			e.connectedKnodes[1] == edge.connectedKnodes[0] :
				if leftKnode == null:
					leftKnode  = knodeClass.instance()
					edge.connectedKnodes[0] = leftKnode
					Myglobals.allKnodesBase.add_child(leftKnode)
			if  e.connectedKnodes[0] == edge.connectedKnodes[1] or\
			e.connectedKnodes[1] == edge.connectedKnodes[1] :
				if rightKnode == null:
					rightKnode  = knodeClass.instance()
					edge.connectedKnodes[1] = rightKnode
					Myglobals.allKnodesBase.add_child(rightKnode)

	if leftKnode == null:
		leftKnode = edge.connectedKnodes[0]

	if rightKnode == null:
		rightKnode = edge.connectedKnodes[1]

	leftKnode.position = oldLpos
	leftKnode.position.y -=30
	rightKnode.position = oldRpos
	rightKnode.position.y -=30
	leftKnode.neighbors.append(rightKnode)
	edge.connectedKnodes[0] = leftKnode
	edge.connectedKnodes[1] = rightKnode
	edge.get_node("Sprite").visible = false
	electricSolver.updateBase()
	
	
func pullWithEdge(distance, edge):
	var visitedK = []
	var visitedE = []
	for e in allEdgesBase.get_children():
		visitedE.append(false)
	for k in allKnodesBase.get_children():
		visitedK.append(false)
	
	pullWithRec(distance, edge, visitedE, visitedK)

func pullWithRec(distance, edge, visitedE, visitedK):
	if !visitedE[edge.get_position_in_parent()]:
		moveEdge(edge, distance,visitedK)
		visitedE[edge.get_position_in_parent()] = true
		
		for e in allEdgesBase.get_children():
			if e!=edge and !visitedE[ e.get_position_in_parent()]:
				if e.connectedKnodes[0] == edge.connectedKnodes[0] or \
				e.connectedKnodes[0] == edge.connectedKnodes[1] or\
				e.connectedKnodes[1] == edge.connectedKnodes[0] or\
				e.connectedKnodes[1] == edge.connectedKnodes[1]:
					if !e.isCable:
						pullWithRec(distance,e,visitedE,visitedK)
							
					
func moveEdge(edge:Edge , distance, visitedK):
	if edge.moduleOnEdge != null:
		edge.moduleOnEdge.position += distance
	if !visitedK[edge.connectedKnodes[0].get_position_in_parent()]:
		edge.connectedKnodes[0].position += distance
		visitedK[edge.connectedKnodes[0].get_position_in_parent()] = true
		
	if !visitedK[edge.connectedKnodes[1].get_position_in_parent()]:
		edge.connectedKnodes[1].position += distance
		visitedK[edge.connectedKnodes[1].get_position_in_parent()] = true
	
func macheNeuesModul(pos,type):
	var nm
	
	if type == ModulTypes.Lamp:
		nm = lampClass.instance()
		
	elif type == ModulTypes.Battery:
		nm = batteryClass.instance()
	elif type == ModulTypes.Ampermeter:
		nm = ampereClass.instance()
	elif type == ModulTypes.Voltmeter:
		nm = voltClass.instance()
	elif type == ModulTypes.Resistor:
		nm = resistorClass.instance()
	else:
		return
		
#	allModulesBase.add_child(nm)
#	nm.myInit(pos,true,true)
#
#func macheNeueKabel(position, dragging):
#	var edgeL = edgeClass.instance()
#	edgeL.own_init(allEdgesBase, position,dragging)
#	return edgeL

	allModulesBase.add_child(nm)
	pos.y -= 70
	nm.myInit(pos,true,false)
	
	
func macheNeueKabel(position, dragging):
	var edgeL = edgeClass.instance()
	position.y -= 90  # Kabel 30 Einheiten nach oben verschieben
	dragging = false  # Setze dragging auf False

	edgeL.own_init(allEdgesBase, position, dragging)
	return edgeL


#set owner of all nodes recursive
func setOwnerOffAll(node,root):
	if node != root:
		node.owner = root
	for child in node.get_children():
		if is_instanced_from_scene(child)==false:
			_set_owner(child, root)
		else:
			child.owner = root

func load_score():
	Saver.load_game()

func _set_owner(node , root):
	if node != root:
		node.owner = root
	for child in node.get_children():
		if is_instanced_from_scene(child)==false:
			_set_owner(child, root)
		else:
			child.set_owner(root)


func is_instanced_from_scene(p_node):
	if not p_node.filename.empty():
		return true
	return false
	

