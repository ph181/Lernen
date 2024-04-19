extends Module

class_name Ampermeter

	
func myInit(pos,move,dragging):
	.myInit(pos,move,dragging)
	myEdge.isLockedDirection = true


func save_this():
	var dict = .save_this()
	dict[SaveNames.save_type]="Ampermeter"
	return dict


func checkLeftRightPoles():
	
	$leftK.position = myEdge.connectedKnodes[0].position - position
	$rightK.position = myEdge.connectedKnodes[1].position - position

func _process(_delta):
	$AmperLabel.text = str(stepify(myEdge.power,0.01)) + " A"
	if abs(myEdge.power) >99.0:
		$AmperLabel.text = "!Max"
	checkLeftRightPoles()
	
func delete_module():
	.delete_module()
	for c in get_children():
		c.queue_free()
	self.queue_free()
