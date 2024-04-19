extends ExperimentAufgabe



func onClose(closed):
	pass
	if closed:
		for e in Myglobals.allEdgesBase.get_children():
			if abs(e.power) > 0.0:
				if e.moduleOnEdge !=null:
					if e.moduleOnEdge is Lamp:
						if !levelComplete:
							$Aufgabe.pressed = true
							.completed()


func onClosedGraph(_G,_root,_cycles):
	pass
