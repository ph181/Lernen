extends Module

class_name Lamp


func save_this():
	var dict = .save_this()
	dict[SaveNames.save_type]="Lamp"
	return dict

func _ready():
	pass

func myInit(pos,move,dragging):
	.myInit(pos,move,dragging)
	myEdge.originalR =10.0
	
	
func _process(_delta):
	$Light2D.energy = abs(myEdge.power)
	$Light2D2.energy = abs(myEdge.power)*1.2
	$Light2D2.scale =Vector2(1+abs(myEdge.power),1+abs(myEdge.power))
	$Light2D3.energy = abs(myEdge.power)*1.2
	$Light2D3.scale =Vector2(1.5+abs(myEdge.power*1.5),1.5+abs(myEdge.power*1.5))
	
	if $Light2D2.scale.x >3:
		$Light2D2.scale.x = 3
		$Light2D2.scale.y = 3
	if $Light2D.energy > 4:
		$Light2D.energy = 3
		$Light2D2.energy = 4
	if $Light2D3.scale.x >4:
		$Light2D3.scale.x = 4
		$Light2D3.scale.y = 4
	
		
func delete_module():
	.delete_module()
	for c in get_children():
		c.queue_free()
	self.queue_free()
