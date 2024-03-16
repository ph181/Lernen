extends Area2D


func _ready():
	pass

func _on_NPC_SL_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			$ColorRect.visible=true
			$NPC_SL.playing = true
			$AnimationPlayer.play("Dialog")


func _on_NPC_SL_mouse_entered():
	Input.set_default_cursor_shape(2)


func _on_NPC_SL_mouse_exited():
	Input.set_default_cursor_shape(0)
	
	
func _on_Label2_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			$ColorRect.visible=false
			$NPC_SL.playing = false


