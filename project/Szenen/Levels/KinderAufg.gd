extends Node2D


var completed = false
export var hiddenComplete : bool = false
var clickedValidate = 0



# ueberpruefen
func _on_ButtonMainMenuBg_clicked(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			if !completed:
				var done = true
				clickedValidate += 1
				if clickedValidate ==1:
					for t in $tasks.get_children():
						if !t.valdiateTask1():
							done = false
					if !done:
						for t in $tasks.get_children():
							SoundFx.wrongsound()
							t.shake()
						$JumpToPage.visible = true
				elif clickedValidate ==2:
					for t in $tasks.get_children():
						if !t.valdiateTask2():
							done = false
					if !done:
						for t in $tasks.get_children():
							SoundFx.wrongsound()
							t.shake()
				elif clickedValidate ==3:
					for t in $tasks.get_children():
						if !t.valdiateTask3():
							SoundFx.wrongsound()
							done = false
							
				else:
					for t in $tasks.get_children():
						if !t.valdiateTask3():
							SoundFx.wrongsound()
							done = false
				if done:
					completed = true
					SoundFx.correctsound()
					$Button/Label.text = "Weiter"
					GlobalScenes.AufgabenView.completedLvl(clickedValidate-1)
					for t in $tasks.get_children():
						t.get_child(0).get_child(0).get_child(1).disabled = true
						t.get_node("myTask").get_child(0).frame =1
					Myglobals.progressInfo.progressMade()
					
					$Reward.giveStars(clickedValidate-1)
				else:
					Myglobals.progressInfo.fehlerAufgabe()
#					for t in $tasks.get_children():
#						t.shake()
			else:
				GlobalScenes.AufgabenView.nextLevel()
				$Reward/Gift/AnimationPlayer.advance($Reward/Gift/AnimationPlayer.current_animation_length- $Reward/Gift/AnimationPlayer.current_animation_position)


func _on_ButtonZurueck_clicked(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			Myglobals.gotoScene(GlobalScenes.AufgabenView)

func save_this():
	var dict = {}
	var taskStates = []
	for t in $tasks.get_children():
		taskStates.append(t.get_node("myTask").get_child(0).get_node("CheckBox").pressed)
	dict["taskstates"] = taskStates
	dict["completed"] = completed
	return dict
	
func load_this(dict):
	var tskStates = dict["taskstates"]
	for t in range (tskStates.size()):
		$tasks.get_child(t).get_node("myTask").get_child(0).get_node("CheckBox").pressed = tskStates[t]
	completed = dict["completed"]

