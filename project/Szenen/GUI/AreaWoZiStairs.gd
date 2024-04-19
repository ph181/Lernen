extends Area2D


func _on_AreaWoZi_mouse_entered():
	Input.set_default_cursor_shape(2)
	$CollisionPolygon2D/Sprite.visible = true


func _on_AreaWoZi_mouse_exited():
	Input.set_default_cursor_shape(0)
	$CollisionPolygon2D/Sprite.visible = false
