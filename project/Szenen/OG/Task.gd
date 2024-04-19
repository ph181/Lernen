extends Node2D

export var hiddenCorrect : bool = false


class_name SquareTask

func valdiateTask1():
	if $myTask.get_child(0).get_child(1).pressed == hiddenCorrect:
		return true
	else:
		$AnimationPlayer.play("shake")
		
		return false
		
func valdiateTask2():
	if $myTask.get_child(0).get_child(1).pressed == hiddenCorrect:
		
		return true
	else:
		$AnimationPlayer.play("shake")
		return false
#
func valdiateTask3():
#	
	if $myTask.get_child(0).get_child(1).pressed == hiddenCorrect:
		if(hiddenCorrect):
			$myTask.get_child(0).frame = 1
		else:
			$myTask.get_child(0).frame = 0
		return true
	else:
		if($myTask.get_child(0).get_child(1).pressed):
			$myTask.get_child(0).frame = 2
		else:
			$myTask.get_child(0).frame = 0
		$AnimationPlayer.play("shake")
		return false

func shake():
	$AnimationPlayer.play("shake")
	
func _on_Control_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if event.is_pressed():
				SoundFx.checksound()
				$myTask.get_child(0).get_child(1).pressed = !$myTask.get_child(0).get_child(1).pressed
