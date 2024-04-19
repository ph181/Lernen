extends Module

class_name Voltmeter
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func save_this():
	var dict = .save_this()
	dict[SaveNames.save_type]="Voltmeter"
	return dict


func myInit(pos,move, dragging):
	.myInit(pos,move, dragging)
	myEdge.originalR = 100000.0
	myEdge.isLockedDirection = true
	
func _process(_delta):
	var txt =  myEdge.power * myEdge.resistance
	if txt ==-0:
		txt=0
	$Label.text = str(stepify(txt,0.1))+" V"
	
	checkLeftRightPoles()

func checkLeftRightPoles():
	
	$leftK.position = myEdge.connectedKnodes[0].position - position
	$rightK.position = myEdge.connectedKnodes[1].position - position


func delete_module():
	.delete_module()
	for c in get_children():
		c.queue_free()
	self.queue_free()

