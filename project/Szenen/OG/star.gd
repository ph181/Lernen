extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func fillStars(event):
	if event is InputEventMouseButton:
		for c in get_parent().get_children():
			c.get_child(0).visible = false
			
		for i in range (get_position_in_parent()+1):
			get_parent().get_child(i).get_child(0).visible = true
		get_parent().get_parent().get_node("Sprite/ok").visible = true


func _on_Sprite_gui_input(event):
	fillStars(event)

