extends ExperimentAufgabe

func onClose(_closed):
	pass

		

func onClosedGraph(_G,_root,cycles):
	if !levelComplete:
		if cycles.size() >0:
			var b = 0
			var l = 0
			for e in Myglobals.allEdgesBase.get_children():
				var found = false
				for cc in cycles:
					for c in cc:
						if c[0]== e.connectedKnodes[0].get_position_in_parent() or c[1] == e.connectedKnodes[0].get_position_in_parent()or c[0]== e.connectedKnodes[1].get_position_in_parent() or c[1] == e.connectedKnodes[1].get_position_in_parent()  :
							found = true
						
				if found and e.moduleOnEdge !=null:
					if abs(e.power)> 0:
						if e.moduleOnEdge is Battery:
							b+=1
						if e.moduleOnEdge is Lamp:
							l +=1
			if l ==0 and b > 0:
				$Aufgabe.pressed = true
				.completed()