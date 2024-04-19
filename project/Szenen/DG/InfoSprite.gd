extends Sprite


var cutLeft = false
var cutRight = false


func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == 2 or event.doubleclick:
				if abs(event.position.x - get_parent().position.x) < 20 and abs(event.position.y - get_parent().position.y) < 20:
					visible = true
					if !get_parent().turn(-1,true):
						$TurnCCW.visible = false
						$TurnLSprite.visible = false
					else:
						get_parent().turn(1,false)
						$TurnCCW.visible = true
						$TurnLSprite.visible = true
					if !get_parent().turn(1,true):
						$TurnCW.visible = false
						$TurnRSprite.visible = false
					else:
						get_parent().turn(-1,false)
						$TurnCW.visible = true
						$TurnRSprite.visible = true
					get_tree().set_input_as_handled()
		else:
			if abs(event.position.x - get_parent().position.x) > 20 and abs(event.position.y - get_parent().position.y) > 20:
				visible = false	





##mobile
#func _unhandled_input(event):
#	if event is InputEventScreenTouch:
#		if event.is_pressed():
#			if event.index == 1:
#				if abs(event.position.x - get_parent().position.x) < 20 and abs(event.position.y - get_parent().position.y) < 20:
#					visible = true
#					if !get_parent().turn(-1,true):
#						$TurnCCW.visible = false
#						$TurnLSprite.visible = false
#					else:
#						get_parent().turn(1,false)
#						$TurnCCW.visible = true
#						$TurnLSprite.visible = true
#
#					if !get_parent().turn(1,true):
#						$TurnCW.visible = false
#						$TurnRSprite.visible = false
#					else:
#						get_parent().turn(-1,false)
#						$TurnCW.visible = true
#						$TurnRSprite.visible = true
#					get_tree().set_input_as_handled()

