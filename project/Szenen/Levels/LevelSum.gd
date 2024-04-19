extends Control

class_name LevelSum

var completed = false
var fehler = -1
# Called when the node enters the scene tree for the first time.
func _ready():
	checkCompl()
		
func checkCompl():
	if completed:
		completedLvl(fehler)
		

func completedLvl(f):
	$Sprite.modulate.r = 255
	$Sprite.modulate.b = 255
	$Sprite.modulate.g = 255
	$Sprite.modulate.a = 255
	$LvlIndex.modulate.a =  255
	$on.visible = true
	completed = true
	fehler = f
	updateStars()
	
func updateStars():
	if(fehler == -1):
		return
	if (fehler == 0):#3stars
		$star1.visible = true
		$star2.visible = true
		$star3.visible = true
		
	elif (fehler <3):#2stars
		$star1.visible = true
		$star2.visible = true
		
	else:#1star
		$star1.visible = true

	
func _on_LevelSum_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			SoundFx.buttonsound()
			$Sprite.modulate.a = 0.7
			get_parent().get_parent().get_parent()._on_LevelSum(get_position_in_parent())


func _on_LevelSum_mouse_entered():
	$Sprite.modulate.a = 1
	


func _on_LevelSum_mouse_exited():
	if !completed: 
		$Sprite.modulate.a = 0.7
