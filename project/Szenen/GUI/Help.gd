extends Node2D


func _ready():
	pass # Replace with function body.


func _on_Label_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			$TextureRect.visible = true
			
			
func _on_close_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			$TextureRect.visible = false




func _on_Label_mouse_entered():
	$Sprite.scale = Vector2(1.1,1.1)


func _on_Label_mouse_exited():
	$Sprite.scale = Vector2(1,1)


