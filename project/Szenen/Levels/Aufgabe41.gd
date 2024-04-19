extends ExperimentAufgabe


func onClose(_closed):
	pass
	

				
func onClosedGraph(_G,_root,cycles):
	if !levelComplete:
		if cycles.size() >1:
			var l = 0
			var ltotal = 0
			var lParallel = []
			for e in Myglobals.allEdgesBase.get_children():
				var found = false
				for cc in cycles:
					for c in cc:
						if c[0]== e.connectedKnodes[0].get_position_in_parent() or c[1] == e.connectedKnodes[0].get_position_in_parent()or c[0]== e.connectedKnodes[1].get_position_in_parent() or c[1] == e.connectedKnodes[1].get_position_in_parent()  :
							found = true
						
				if found and e.moduleOnEdge !=null:
					if e.moduleOnEdge is Lamp:
						if e.power == 0:
							continue
						ltotal+= 1
						if lParallel.size() == 0:
							lParallel.append(abs(e.power))
						else:
							for p in lParallel:
								if abs(abs(e.power) - abs(p)) < 0.2 :
									l += 1
									break
							lParallel.append(e.power)
							
			if l >0 and ltotal == 3:
				$Aufgabe.pressed = true
				.completed()
				
