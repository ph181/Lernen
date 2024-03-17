extends Node2D


func _ready():
	for i in range(6):
		var label = get_node("Schrank/Sprite" + str(i) + "/Label")
		var tools = get_node("tools" + str(i))
		label.mouse_entered.connect(_on_mouse_entered.bind(i))
		label.mouse_exited.connect(_on_mouse_exited.bind(i))
		label.gui_input.connect(_on_gui_input.bind(i))
		for k in range(4):
			var util = get_node("tools" + str(i) + "/util" + str(k))
			util.mouse_entered.connect(_on_mouse_entered_util.bind(i,k))
			util.mouse_exited.connect(_on_mouse_exited_util.bind(i,k))

func _on_mouse_entered(i):
	var sprite = get_node("Schrank/Sprite" + str(i))
	sprite.scale *= 1.2

func _on_mouse_exited(i):
	var sprite = get_node("Schrank/Sprite" + str(i))
	sprite.scale /= 1.2

func _on_gui_input(event,i):
	var tools = get_node("tools" + str(i))
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == 1:
		tools.visible = true
		get_node("CloseRaum").visible = false

func _on_mouse_entered_util(i,k):
	var colorrect = get_node("tools" + str(i) + "/util" + str(k) + "/ColorRect")
	var textrect = get_node("tools" + str(i) + "/util" + str(k) + "/TextureRect")
	colorrect.visible = true
	textrect.scale *= 1.2

func _on_mouse_exited_util(i,k):
	var colorrect = get_node("tools" + str(i) + "/util" + str(k) + "/ColorRect")
	var textrect = get_node("tools" + str(i) + "/util" + str(k) + "/TextureRect")
	colorrect.visible = false
	textrect.scale /= 1.2

func _on_CloseRaum_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			get_tree().change_scene_to_file("res://Szenen/Klassenzimmer.tscn") # 

func _on_CloseRaum_mouse_entered():
	get_node("CloseRaum").scale *= 1.2

func _on_CloseRaum_mouse_exited():
	get_node("CloseRaum").scale /= 1.2

