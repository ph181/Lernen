extends Node2D

var drag = false
signal dragsignal

func _ready():
	for i in range(3):
		var area = get_node("pferd" + str(i) + "/area")
		var tool = get_node("tool" + str(i) + "/tool")
		tool.dragsignal.emit(_set_drag_pc)
		tool.input_event.connect(_on_input_event.bind(i))
		area.body_entered.connect(_on_body_entered.bind(i))
		get_node("pferd" + str(i+1) + "/pferd/Rect").set_deferred("disabled", true)

func _process(delta):
	if drag: self.position = get_viewport().get_mouse_position()
#		var mousepos = get_viewport().get_mouse_position()
#		self.position = Vector2(mousepos.x, mousepos.y)
		
		
func _on_body_entered(i):
	var sprite = get_node("pferd" + str(i+1))
	var tool = get_node("tool" + str(i) + "/tool")
	if tool.name == "tool" +str(i):
		get_tree().queue_delete(self)
		get_parent().get_node("done").visible = true
		sprite.visible = true
		get_parent().get_node("pferd_3/pferd_3/schrauben").set_deferred("disabled", false)

func _set_drag_pc(i): drag = !drag

func _on_input_event(viewport, event, shape_idx):
	Input.set_default_cursor_shape(0)

	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == BUTTON_LEFT and self.get_rect().has_point(self.get_local_mouse_position()):
			drag = true
		elif not event.is_pressed() and event.button_index == BUTTON_LEFT:
			drag = false
