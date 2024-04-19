extends ExperimentAufgabe


var first = null
var parallelsolved = false
var rowsolved = false

func onClose(_closed):
	first = null
	parallelsolved = false
	rowsolved = false

func onClosedGraph(_G,root,cycles):
	if !levelComplete:
		if cycles.size() >0:
			var b = 0
			var l = 0
			if !rowsolved:
				for e in Myglobals.allEdgesBase.get_children():
					var found = false
					for cc in cycles:
						for c in cc:
							if c[0]== e.connectedKnodes[0].get_position_in_parent() or c[1] == e.connectedKnodes[0].get_position_in_parent()or c[0]== e.connectedKnodes[1].get_position_in_parent() or c[1] == e.connectedKnodes[1].get_position_in_parent()  :
								found = true
							
					if found and e.moduleOnEdge !=null:
						if abs(e.power)> 0.43 and abs(e.power)< 0.47:
							if e.moduleOnEdge is Battery:
								b+=1
							if e.moduleOnEdge is Lamp:
								l +=1
				if l ==2 and b == 1:
					if first != null :
						if first != root:
							$Aufgabe.pressed = true
							.completed()
					else:
						first = root
						rowsolved = true
			if !parallelsolved:
					
				for e in Myglobals.allEdgesBase.get_children():
					var found = false
					for cc in cycles:
						for c in cc:
							if c[0]== e.connectedKnodes[0].get_position_in_parent() or c[1] == e.connectedKnodes[0].get_position_in_parent()or c[0]== e.connectedKnodes[1].get_position_in_parent() or c[1] == e.connectedKnodes[1].get_position_in_parent()  :
								found = true
							
					if found and e.moduleOnEdge !=null:
						if abs(e.power)> 0.88 and abs(e.power)< 0.92:
							if e.moduleOnEdge is Lamp:
								l +=1
						if e.moduleOnEdge is Battery:
								b+=1
				if l ==2 and b == 1:
					if first != null:
						if first != root:
							$Aufgabe.pressed = true
							.completed()
					else:
						first = root
						parallelsolved = true
					
					
	
