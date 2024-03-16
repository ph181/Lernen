extends Area2D

var open = false



func _on_Door_F_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			get_tree().change_scene("res://Szenen/Klassenzimmer.tscn") # 
			Input.set_default_cursor_shape(0)	 # Replace with function body.
			

func _on_Door_F_mouse_entered():
	Input.set_default_cursor_shape(2)
	#$CollisionPolygon2D/Sprite.visible = true	
func _on_Door_F_mouse_exited():
	Input.set_default_cursor_shape(0)	 # Replace with function body.
	#$CollisionPolygon2D/Sprite.visible = false	

