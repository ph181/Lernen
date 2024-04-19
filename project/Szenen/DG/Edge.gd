extends Node2D

class_name Edge
var knodeClass = preload("res://Szenen/DG/Knode.tscn")
var connectedKnodes = []
var resistance : float = 0.00001
var originalR : float = 0.00001
var voltage :float = 0.0
var drag = false
export (bool) var isCable =true
var moduleOnEdge  = null
export var midx : float
export var midy :float
var power : float =0.0
export var isLockedDirection : bool = false
var leftknode :Knode
var rightknode  :Knode



func own_init(parentGiven, origPosition, dragging):
	leftknode = knodeClass.instance()
	rightknode = knodeClass.instance()
	if origPosition != null:
		position = origPosition
	leftknode.position = $Line2D.points[0] + position
	rightknode.position = $Line2D.points[1] + position
	if moduleOnEdge !=null:
		leftknode.position.x -= 36
		rightknode.position.x += 36
	else:
		rightknode.position.y += 36
	leftknode.neighbors.append(rightknode)
	connectedKnodes.append(leftknode)
	connectedKnodes.append(rightknode)
	if get_parent() == null:
		parentGiven.add_child(self)
	get_parent().get_parent().get_node("Knodes").add_child(leftknode)
	get_parent().get_parent().get_node("Knodes").add_child(rightknode)
	drag = dragging
	if drag:
		setDrag()
	print($Line2D.points[0])
	print($Line2D.points[1])


func _process(_delta):
	if !visible:
		return
	#position = connectedKnodes[1].position + (connectedKnodes[0].position - connectedKnodes[1].position)/2
	$Line2D.clear_points()
	$Line2D.add_point(connectedKnodes[0].position - position)
	$Line2D.add_point(connectedKnodes[1].position - position)
	$Line2D/Path2D.curve.clear_points()
	$Line2D/Path2D.curve.add_point(connectedKnodes[0].position-position)
	for i in range(20):
		$Line2D/Path2D.curve.add_point( (connectedKnodes[1].position- connectedKnodes[0].position)*(1.0/(i+1)) + connectedKnodes[0].position-position)
	$Line2D/Path2D.curve.add_point(connectedKnodes[1].position-position)
	var dist = connectedKnodes[0].position -  connectedKnodes[1].position
	if isCable and moduleOnEdge == null:
		resistance = originalR * ( dist.length()/100)
	else:
		resistance = originalR
	$Mid/power.text = str(power)
	$Mid.position= connectedKnodes[0].position-position + (connectedKnodes[1].position - connectedKnodes[0].position)/2
	$Sprite.position =$Mid.position
	$Sprite.position.y -= 20


func _unhandled_input(event):
	if !visible:
		return
	if event is InputEventMouseButton :
		maus(event)
	elif event is InputEventScreenTouch :
		mobile(event)
		
		
func maus(event):
	if !visible:
		return
	if event is InputEventMouseButton :
		if event.is_pressed():
			var distance = event.position-position - $Line2D/Path2D.get_curve().get_closest_point(event.position-position)
			if abs(distance.x)<=10 and abs(distance.y)<=10:
				if event.button_index==1:
						drag = true
				if event.button_index==2 or event.doubleclick:
					if isCable:
						$Sprite.visible = true
				get_tree().set_input_as_handled()		
		else:
			z_index = 0
			connectedKnodes[0].z_index= 0
			connectedKnodes[1].z_index= 0
			drag = false
			if $Line2D/Path2D.get_curve().get_point_count() >0:
				if event.button_index==1  :
					var distance = event.position - $Line2D/Path2D.get_curve().get_closest_point(event.position-position)-position
					if abs(distance.x)>15 or abs(distance.y)>15:
						$Sprite.visible = false
			for m in Myglobals.allModulesBase.get_children():
				for mm in Myglobals.allModulesBase.get_children():
					if m!= mm:
						if abs(m.position.x - mm.position.x) <=15 and\
						abs(m.position.y - mm.position.y) <=15 :
							return
			Myglobals.checkCombine(event,connectedKnodes[0])
			Myglobals.checkCombine(event,connectedKnodes[1])
	if event is InputEventMouseMotion:
		if drag:
			var distance = event.position - $Mid.position  -position
			if event.position.x < 5 or event.position.x > 1275 or event.position.y < 5 or event.position.y >715:
				return
			Myglobals.pullWithEdge(distance,self)

##mobile
func mobile(event):
	if !visible:
		return
	if event is InputEventScreenTouch :
		if event.is_pressed():
			var distance = event.position-position - $Line2D/Path2D.get_curve().get_closest_point(event.position-position)
			if abs(distance.x)<=10 and abs(distance.y)<=10:
				if event.index == 0:
						drag = true
				if event.index ==1:
					if isCable:
						$Sprite.visible = true
				get_tree().set_input_as_handled()		
		else:
			z_index = 0
			connectedKnodes[0].z_index= 0
			connectedKnodes[1].z_index= 0
			drag = false
			for m in Myglobals.allModulesBase.get_children():
				for mm in Myglobals.allModulesBase.get_children():
					if m!= mm:
						if abs(m.position.x - mm.position.x) <=15 and\
						abs(m.position.y - mm.position.y) <=15 :
							return
			Myglobals.checkCombine(event,connectedKnodes[0])
			Myglobals.checkCombine(event,connectedKnodes[1])
	if event is InputEventScreenDrag:
		if drag:
			var distance = event.position - $Mid.position  -position
			if event.position.x < 5 or event.position.x > 1275 or event.position.y < 5 or event.position.y >715:
				return
			Myglobals.pullWithEdge(distance,self)
#-----------------------


func _on_CutGUI_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if event.is_pressed():
					Myglobals.cutOutEdge(self)

func _on_DeleteGUI_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if event.is_pressed():
				deleteMe()
					
func deleteMe():
	Myglobals.cutOutEdge(self)
	if moduleOnEdge != null:
		moduleOnEdge = null
	knodeClass = null
	connectedKnodes[0].get_parent().remove_child(connectedKnodes[0])
	connectedKnodes[1].get_parent().remove_child(connectedKnodes[1])
	connectedKnodes[0].queue_free()
	connectedKnodes[1].queue_free()
	for c in get_children():
		c.queue_free()
	self.get_parent().remove_child(self)
	self.queue_free()

func init_move():
	leftknode.position = position
	leftknode.position.x -= 36
	rightknode.position = position
	rightknode.position.x += 36

func setDrag():
	drag=true
	z_index = 3
	connectedKnodes[0].z_index= 3
	connectedKnodes[1].z_index= 3


func fire():
	$Line2D.modulate.g = 0
	$Line2D.modulate.b = 0
	
func resetFire():
	$Line2D.modulate = Color("#ffffff")
	
func save_this():
	var cc=[]
	var lkIndex = -1
	var rkIndex = -1
	if leftknode != null:
		lkIndex = leftknode.get_position_in_parent()
	if rightknode != null:
		rkIndex = rightknode.get_position_in_parent()
	var moEIndex = -1
	if moduleOnEdge != null:
		moEIndex = moduleOnEdge.get_position_in_parent()
	for c in connectedKnodes:
		cc.append(c.get_position_in_parent())
	var dict = {
		SaveNames.save_type:"Edge",
		SaveNames.save_posX : position.x,
		SaveNames.save_posY : position.y,
		SaveNames.save_posInPar : get_position_in_parent(),
		SaveNames.e_connectedKnodes : cc,
		SaveNames.e_isCable : isCable,
		SaveNames.e_isLockedDirection : isLockedDirection,
		SaveNames.e_originalR : originalR,
		SaveNames.e_resistance : resistance,
		SaveNames.e_voltage : voltage,
		SaveNames.e_midx : midx,
		SaveNames.e_midy : midy,
		SaveNames.e_leftKnode : lkIndex,
		SaveNames.e_rightKnode : rkIndex,
		SaveNames.e_moduleOnEdge : moEIndex,
	}
	return dict
