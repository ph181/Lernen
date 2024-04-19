extends Node2D

signal hovered
signal pressed

var hover = Vector2(1.1,1.1)
var normal= Vector2(1,1)


func _ready():
	emit_signal("hovered")
	emit_signal("pressed")
	for i in range(1, 7):
		var error1 = get_node("BG/Sprite"+str(i)+"/Label").connect("gui_input", self, "_on_Label_input", [i])
		var error2 = get_node("vid/vid"+str(i)+"/close").connect("gui_input", self, "_on_Close_input", [i])
		if error1 != OK:
			print("Failed to connect signal: ", error1)
		if error2 != OK:
			print("Failed to connect signal: ", error2)
#		get_node("BG/Sprite"+str(i)+"/Label").connect("mouse_entered", self, "_on_Sprite_mouse_entered", [i])
#		get_node("BG/Sprite"+str(i)+"/Label").connect("mouse_exited", self, "_on_Sprite_mouse_exited", [i])
		
		
#func _on_Sprite_mouse_entered(event,i):
#	if event is InputEventMouseButton:
#		for i in range(1, 7):
#			get_node("BG/Sprite"+str(i)+"/Label").add_color_override("font_color", Color("#39c031"))
#			get_node("BG/Sprite"+str(i)).scale = hover
#
#func _on_Sprite_mouse_exited(event,i):
#	for i in range(1, 7):
#		get_node("BG/Sprite"+str(i)+"/Label").add_color_override("font_color", Color("#000000"))
#		get_node("BG/Sprite"+str(i)).scale = normal

func _on_Label_input(event, i):
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed():
		get_node("vid/vid" + str(i)).visible = true

func _on_Close_input(event, i):
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed():
		get_node("vid/vid" + str(i)).visible = false


func _on_close_gui_input(event):
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed():
			visible = false


func print_node_structure(node, indent = 0):
	print(" " * indent + node.name)
	for child in node.get_children():
		print_node_structure(child, indent + 2)

# Call the function with the root node of your scene
	print_node_structure(get_tree().root)
