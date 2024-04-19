extends Module

class_name Resistor

var resistance = 0.01
signal resistanceChanged (r)


func _ready():
	pass
	

func myInit(pos,move, dragging):
	.myInit(pos,move, dragging)
	myEdge.originalR = resistance
	myEdge.isLockedDirection = true


func _process(_delta):
#	var txt =  myEdge.power*resistance
#	if txt ==-0:
#		txt=0
	checkLeftRightPoles()

func checkLeftRightPoles():
	$leftK.position = myEdge.connectedKnodes[0].position - position
	$rightK.position = myEdge.connectedKnodes[1].position - position

func delete_module():
	.delete_module()
	for c in get_children():
		c.queue_free()
	self.queue_free()


func _on_ResistanceSlider_value_changed(value):
	resistance = value
	myEdge.originalR = resistance

	$InfoFrameEdge/R.text  = ""
	$InfoFrameEdge/R.text  = ""+str(resistance) + " Ohm"
	emit_signal("resistanceChanged", value)



func save_this():
	var dict = .save_this()
	dict[SaveNames.save_type]="Resistor"
	return dict



