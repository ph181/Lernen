extends Area2D

func _ready():
	pass


func _on_Label2_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			$ColorRect.visible=false
			$NPC_HM.playing = false

func _on_NPC_HM_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			$NPC_HM.playing = true
			$ColorRect.visible=true
			$AnimationPlayer.play("Dialog")
			


func _on_NPC_HM_mouse_entered():
	Input.set_default_cursor_shape(2)


func _on_NPC_HM_mouse_exited():
	Input.set_default_cursor_shape(0)


