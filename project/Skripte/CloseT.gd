extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			get_parent().visible = false
#			get_parent().get_parent().get_node("CloseRaum").visible = true 
			


func _on_mouse_entered():
	scale *= 1.2


func _on_mouse_exited():
	scale /= 1.2
