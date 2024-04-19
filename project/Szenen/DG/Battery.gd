extends Module

class_name Battery

var maxduration : float= 300.0
var duration = maxduration 


func save_this():
	var dict = .save_this()
	dict[SaveNames.save_type]="Battery"
	return dict
	
func myInit(pos,move,dragging):
	.myInit(pos,move,dragging)
	$ProgressBar.max_value = maxduration
	myEdge.voltage = 9.0
	myEdge.originalR = 0.001
	myEdge.isLockedDirection = true


func _input(event):
	if event is InputEventKey:
		if event.unicode == KEY_0:
			duration =300
			myEdge.voltage = 9

func _process(delta):
	if turned ==0 :
		$Sprite.region_rect.position.x = 0
		$Sprite.flip_h = false
	if turned == 1 :
		$Sprite.region_rect.position.x = 96
		$Sprite.flip_h = false
	if turned == 2 :
		$Sprite.region_rect.position.x = 0
		$Sprite.flip_h = true
	if turned == 3 :
		$Sprite.region_rect.position.x = 48
		$Sprite.flip_h = false
	
	Myglobals.electricSolver.updateBase()
	if duration <=0:
		self.myEdge.voltage = 0
	else:
		if (self.myEdge.power) >0:
			
			if abs(self.myEdge.power) <100:
				if (duration -self.myEdge.power*delta)< maxduration:
					duration = duration -self.myEdge.power*delta
			else:
				if (duration-self.myEdge.power/abs(self.myEdge.power) * maxduration/10.0 *delta <maxduration):
					duration = duration -self.myEdge.power/abs(self.myEdge.power) * maxduration/10.0 *delta
				
				
			
			
#	if abs(myEdge.power) >0:
#		if abs(myEdge.power) >100:
#			delta = delta*10
#		if duration <=0:
#			self.myEdge.voltage = 0.001
#		else:
#			duration -= delta
#
#	var progress =(duration/maxduration) *100.0
	$ProgressBar.value = duration
	
	
func delete_module():
	.delete_module()
	for c in get_children():
		c.queue_free()
	self.queue_free()
	
