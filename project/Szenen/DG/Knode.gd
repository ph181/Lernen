extends Node2D

class_name  Knode

var neighbors  = []
var drag = false



func _process(_delta):
	$index/Label.text = str(get_position_in_parent())
	var ns = ""
	for n in neighbors:
		ns += str(n.get_position_in_parent())+", "
	$index/Nighbors.text = ns
	
	
func _ready():
	pass
	
	
func save_this():
	var neighs = []
	for n in neighbors:
		neighs.append(n.get_position_in_parent())
	
	var dir = {
		SaveNames.save_type : "Knode",
		SaveNames.save_posX : position.x,
		SaveNames.save_posY : position.y,
		SaveNames.save_posInPar : get_position_in_parent(),
		SaveNames.k_neighbors : neighs
	}
	return dir



func _unhandled_input(event):
	if !visible:
		return
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == 1:
				if abs(event.position.x - self.position.x)<12 and\
				abs(event.position.y - self.position.y)<12:
					drag = true
					get_tree().set_input_as_handled()

		else:
			if drag:
				drag = false
				for m in Myglobals.allModulesBase.get_children():
					for mm in Myglobals.allModulesBase.get_children():
						if m!= mm:
							if abs(m.position.x - mm.position.x) <=20 and\
							abs(m.position.y - mm.position.y) <=20 :
								return
				Myglobals.checkCombine(event,self)
	if event is InputEventMouseMotion:
		if event.position.x < 5 or event.position.x > 1275 or event.position.y < 5 or event.position.y >715:
			return
		if drag:
			var hasModulEdge = null
			for e in Myglobals.allEdgesBase.get_children():
				if e.connectedKnodes[0] == self or e.connectedKnodes[1] == self:
					if !e.isCable:
						hasModulEdge = e
					
			if hasModulEdge != null:
				Myglobals.pullWithEdge(event.position-position, hasModulEdge)
			else:
				position = event.position
				

