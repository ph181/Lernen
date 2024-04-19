extends Node2D
var key = -1

var clicked = false
var timeshown = 0


func _process(delta):
	if !clicked and Myglobals.currentScene == GlobalScenes.House:
		timeshown += delta

func ownInit(txt, keyGiven):
	$Sprite/Label.text = txt
	self.key = keyGiven


#func _on_ok_gui_input(event):
#	if event is InputEventMouseButton:
#		if event.is_pressed() and !clicked:
#			Myglobals.game.questionsUsed[key] = true
#			clicked = true
#			var stars = 0
#			for s in $stars.get_children():
#				if s.get_child(0).visible:
#					stars +=1
#			DataCollected.starGiven( key, stars,timeshown )
#
#			if Myglobals.game.waitingflow.size()>0:
#				Myglobals.game.checkFlow()
#				self.visible= false
#			else:
#				$Sprite/Label.text = "Danke!"
#				$AnimationPlayer.play("fadeOut")
#

func _on_ok_mouse_entered():
	$Sprite/ok/Label2.add_color_override("font_color", Color("#39c031"))


func _on_ok_mouse_exited():
	$Sprite/ok/Label2.add_color_override("font_color", Color("#00303a"))


func _on_AnimationPlayer_animation_finished(_anim_name):
	self.queue_free()
	self.get_parent().remove_child(self)
