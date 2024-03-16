extends Area2D




func _on_Door_E_input_event(viewport, event, shape_idx): # Replace with function body.
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			get_tree().change_scene("res://Szenen/Flur.tscn") # 
			Input.set_default_cursor_shape(0)	 # Replace with function body.
			

func _on_Door_E_mouse_entered():
	Input.set_default_cursor_shape(2)
	#$CollisionPolygon2D/Sprite.visible = true	


func _on_Door_E_mouse_exited():
	Input.set_default_cursor_shape(0)	 # Replace with function body.
	#$CollisionPolygon2D/Sprite.visible = false	
