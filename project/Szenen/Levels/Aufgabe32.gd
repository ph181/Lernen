extends ExperimentAufgabe


func onClose(_closed):
	pass


				
func onClosedGraph(_G,_root,cycles):
	if !levelComplete:
		if cycles.size() == 1:
			var b = 0
			var v = 0
			for e in Myglobals.allEdgesBase.get_children():
				var found = false
				for cc in cycles:
					for c in cc:
						if c[0]== e.connectedKnodes[0].get_position_in_parent() or c[1] == e.connectedKnodes[0].get_position_in_parent()or c[0]== e.connectedKnodes[1].get_position_in_parent() or c[1] == e.connectedKnodes[1].get_position_in_parent()  :
							found = true
							

				if found and e.moduleOnEdge !=null:
					if e.moduleOnEdge is Voltmeter:
						v += 1
					if e.moduleOnEdge is Battery:
						b+=1
			if b > 0 and v > 0:
				$Aufgabe.pressed = true
				.completed()
				
