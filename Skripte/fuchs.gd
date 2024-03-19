extends Sprite2D


#var drag = false
#signal dragsignal
#var tool
#
#func _ready():
#	connect("dragsignal", Callable(self, "_set_drag_pc"))
#	for i in range(3):
#		tool = get_parent().get_node("tool" + str(i))
#		tool.input_event.connect(_on_input_event.bind(i, tool))
#
#
#func _process(delta):
#	if drag:
#		var mousepos = get_viewport().get_mouse_position()
#		self.position = Vector2(mousepos.x, mousepos.y)
#
#
#func _set_drag_pc():
#	drag = !drag
#

#func _on_input_event(viewport, event, shape_idx,i, tool):
#	Input.set_default_cursor_shape(0)
#	if event is InputEventMouseButton:
#		if event.button_index == 1 and event.pressed:
#			emit_signal("dragsignal")
#		elif event.button_index == 1 and !event.pressed:
#			emit_signal("dragsignal")
