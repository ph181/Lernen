extends Node2D

class_name Module

var edgeClass = preload("res://Szenen/DG/EdgeLine.tscn")
var knodeClass = preload("res://Szenen/DG/Knode.tscn")
var drag = false
export (PackedScene) var leftKnode = null
export (PackedScene) var rightKnode = null
export (PackedScene)  var myEdge
export var isVertical  : bool =false
var turned :int =0


# ---------- neccessary after constructor!
func myInit(pos,move, dragging):
	myEdge = edgeClass.instance()
	myEdge.own_init(Myglobals.allEdgesBase, null, false)
	drag = dragging
	if drag:
		z_index = 3
		myEdge.z_index = 3

	if move:
		self.position = pos
	
	myEdge.isCable = false
	myEdge.moduleOnEdge = self
	myEdge.position = position
	myEdge.init_move()
	leftKnode = myEdge.connectedKnodes[0]
	rightKnode = myEdge.connectedKnodes[1]

# ---------- input event
func _unhandled_input(event):
	#
	# sets drag on click, 
	if !visible:
		return
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == 1:
				if abs(event.position.x - self.position.x)<24 and abs(event.position.y - self.position.y)<24 :
					drag = true
					get_tree().set_input_as_handled()
					pull_to_front()
					
		else:
			drag = false
			release_from_front()
			if checkAgainstModule():
				return
			if Myglobals.checkCombine(event,myEdge.connectedKnodes[0]):
				leftKnode = null
				print("deleted left")
				
			if Myglobals.checkCombine(event,myEdge.connectedKnodes[1]):
				rightKnode = null
				print("deleted right")
	if event is InputEventMouseMotion:
		if event.position.x < 5 or event.position.x > 1275 or event.position.y < 5 or event.position.y >715:
			return
		if drag:
			Myglobals.pullWithEdge(event.position-self.position, myEdge)

# ---------- collision check
func checkAgainstModule():
	#
	# check bevor combine to avoid connected, stacked modules
	#
	for m in Myglobals.allModulesBase.get_children():
		for mm in Myglobals.allModulesBase.get_children():
			if m!= mm:
				if abs(m.position.x - mm.position.x) <=20 and\
				abs(m.position.y - mm.position.y) <=20 :
					return true
	return false

# ---------- move / drag
func move(distance):
	self.position += distance
	if leftKnode != null:
		leftKnode.position +=distance
	if rightKnode != null:
		rightKnode.position +=distance

func pull_to_front():
	self.get_parent().move_child(self,get_parent().get_child_count() -1)
	self.z_index = 1
	if leftKnode != null:
		leftKnode.z_index = 1
	if rightKnode != null:
		rightKnode.z_index = 1
	myEdge.z_index = 1

func release_from_front():
	self.z_index = 0
	if leftKnode != null:
		leftKnode.z_index = 0
	if rightKnode != null:
		rightKnode.z_index = 0
	myEdge.z_index = 0

# --------- cut and delete
func _on_CutOut_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			cut_out_module()

func delete_module():
	cut_out_module()
	myEdge.deleteMe()
	myEdge.queue_free()
	knodeClass = null
	edgeClass = null
	self.queue_free()
	for c in get_children():
		c.queue_free()

func cut_out_module():
	Myglobals.cutOutEdge(myEdge)
	leftKnode = myEdge.connectedKnodes[0]
	rightKnode = myEdge.connectedKnodes[1]
	self.position.y -=30
	$InfoSprite.visible = false
	Myglobals.electricSolver.updateBase()

func _on_Delete_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			delete_module()

# ---------

# --------- turn stuff
func turn(dir,repeat):
	var canTurnInfo = canTurn()
	var modules
	var side = 0
	var correct = false
	
	if canTurnInfo != null: # else free to move
		modules = canTurnInfo[0]
		if modules.size() >0: # needs correction
			correct = true
			side = canTurnInfo[1]
			
		var sideL = false
		var sideR = false
		for m in modules:

			if m.myEdge.connectedKnodes[0]== myEdge.connectedKnodes[0] or m.myEdge.connectedKnodes[1]== myEdge.connectedKnodes[0]:
				sideL  = true
			if m.myEdge.connectedKnodes[0]== myEdge.connectedKnodes[1] or m.myEdge.connectedKnodes[1]== myEdge.connectedKnodes[1]:
				sideR = true

			if sideL and sideR:
				return false
			
	var oldPos = myEdge.connectedKnodes[side].position 
	if dir == 1: # cw
		# horizontal to
		if turned == 0:
			myEdge.connectedKnodes[0].position = position
			myEdge.connectedKnodes[0].position.y -=36
			myEdge.connectedKnodes[1].position = position
			myEdge.connectedKnodes[1].position.y +=36
			
			turned =1
		# vertical to
		elif turned == 1 :
			myEdge.connectedKnodes[0].position = position
			myEdge.connectedKnodes[0].position.x +=36
			myEdge.connectedKnodes[1].position = position
			myEdge.connectedKnodes[1].position.x -=36
			turned = 2
		# horizontal mirrowed to
		elif turned == 2 :
			myEdge.connectedKnodes[0].position = position
			myEdge.connectedKnodes[0].position.y +=36
			myEdge.connectedKnodes[1].position = position
			myEdge.connectedKnodes[1].position.y -=36
			turned = 3
		# vertical mirrowed to horizontal
		elif turned == 3 :
			myEdge.connectedKnodes[0].position = position
			myEdge.connectedKnodes[0].position.x -=36
			myEdge.connectedKnodes[1].position = position
			myEdge.connectedKnodes[1].position.x +=36
			turned = 0
		
			
	if dir == -1: # ccw
		
		# horizontal to
		if turned == 0:
			myEdge.connectedKnodes[0].position = position
			myEdge.connectedKnodes[0].position.y +=36
			myEdge.connectedKnodes[1].position = position
			myEdge.connectedKnodes[1].position.y -=36
			turned = 3
			
		# vertical mirrowed to
		elif turned == 3 :
			myEdge.connectedKnodes[0].position = position
			myEdge.connectedKnodes[0].position.x +=36
			myEdge.connectedKnodes[1].position = position
			myEdge.connectedKnodes[1].position.x -=36
			turned = 2
		# horizontal mirrowed to
		elif turned == 2 :
			myEdge.connectedKnodes[0].position = position
			myEdge.connectedKnodes[0].position.y -=36
			myEdge.connectedKnodes[1].position = position
			myEdge.connectedKnodes[1].position.y +=36
			turned =1
		#vertical to horizontal
		elif turned == 1 :
			myEdge.connectedKnodes[0].position = position
			myEdge.connectedKnodes[0].position.x -=36
			myEdge.connectedKnodes[1].position = position
			myEdge.connectedKnodes[1].position.x +=36
			turned = 0

	if correct:
		var dist = (myEdge.connectedKnodes[side].position - oldPos)
		self.position -= dist
		myEdge.connectedKnodes[0].position -= dist
		myEdge.connectedKnodes[1].position -= dist
		if checkAgainstModule() and repeat:
			turn(-dir, false)
			return false
	return true	

func canTurn():
	#
	# check to see if turn is possible, or if other modules next to us are affected
	#
	var othersConnectedModules = []
	var side
	for m in Myglobals.allModulesBase.get_children():
		if m!= self:
			for mn in m.myEdge.connectedKnodes:
				if mn == myEdge.connectedKnodes[0]:
					othersConnectedModules.append(m)
					side = 0
				elif mn == myEdge.connectedKnodes[1]:
					othersConnectedModules.append(m)
					side = 1
					
	if othersConnectedModules.size() >0:
		return [othersConnectedModules, side] # free
	return null

func _on_TurnCW_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			turn(1,true)
			$InfoSprite.visible = false
			Myglobals.electricSolver.updateBase()
			
func _on_TurnCCW_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			turn(-1,true)
			$InfoSprite.visible = false
			Myglobals.electricSolver.updateBase()

# --------- save
func save_this():
	var leftindex = -1
	var rightindex = -1
	if leftKnode != null:
		leftindex = leftKnode.get_position_in_parent()
	if rightKnode != null:
		rightindex = rightKnode.get_position_in_parent()
		
	var save_dict = {
			SaveNames.save_posX : position.x,
			SaveNames.save_posY : position.y,
			SaveNames.save_posInPar : .get_position_in_parent(),
			
			SaveNames.m_turned : turned,
			SaveNames.m_isVertical : isVertical,
			
			SaveNames.m_leftKnode : leftindex,
			SaveNames.m_rightKnode : rightindex,
			SaveNames.m_myEdge: myEdge.get_position_in_parent()
		}
	return save_dict
