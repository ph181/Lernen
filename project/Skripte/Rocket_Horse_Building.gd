extends Node2D

signal input_event

var tools
var pferde

func _ready():
	for i in range(2):
		tools = get_node("tool" + str(i) + "/body")
		tools.input_event.connect(_on_tool_input_event.bind(i))
		pferde = get_node("pferd" + str(i) + "/area")


func _on_tool_input_event(viewport, event, shape_idx, i):
	print("Tool ", i, " hat Pferd ", i, " bearbeitet.")
#	pferde[i].do_something() # Ersetzen Sie 'do_something' durch die tatsächliche Methode, die Sie aufrufen möchten.
#		# Wenn Tool0 Pferd0 bearbeitet, erscheint Pferd1
#	if i == 0:
#		pferde[1].show() # Ersetzen Sie 'show' durch die tatsächliche Methode, um Pferd1 anzuzeigen
		
		
		
#var area
#var tool
#var sprite
#
#var drag = false
#signal dragsignal
#
#func _ready():
#	for i in range(3):
#		sprite = get_node("pferd" + str(i) + "/area/shape")
#		sprite.set_deferred("disabled", true)
#		area = get_node("pferd" + str(i+1) + "/area")
#		area.body_entered.connect(_on_body_entered.bind(i))
#		tool = get_node("tool" + str(i))
#		tool.input_event.connect(_on_input_event.bind(i, tool))
#
#func _on_input_event(viewport, event, shape_idx,i, tool):
#	Input.set_default_cursor_shape(0)
#	if event is InputEventMouseButton:
#		if event.button_index == 1 and event.pressed:
#			emit_signal("dragsignal")
#		elif event.button_index == 1 and !event.pressed:
#			emit_signal("dragsignal")
#
#func _on_body_entered(body,i):
#	tool = get_node("tool" + str(i+1) + "/tool")
#	sprite = get_node("pferd" + str(i))
#	if body.name == tool:
#		get_tree().queue_delete(sprite)
#		get_parent().get_node("done").visible = true
#
#
#func _process(delta):
#	if drag:
#		var mousepos = get_viewport().get_mouse_position()
#		tool.position = Vector2(mousepos.x, mousepos.y)
#
#
#func _set_drag_pc():
#	drag = !drag
#
