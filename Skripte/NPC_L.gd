extends Node2D

##var dialogue = preload("res://Skripte/Dialogue.gd")
#
##func _process(delta):
#	if Input.is_action_just_pressed("ui_accept"):
#		# Show a dialog or other UI to allow the player to select a dialogue option
#		pass
#
##func _show_dialogue():
#	# Show the dialogue options and handle the player's response
#	pass
func _ready():
	pass


func _on_NPC_L_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			$NPC_L.playing = true
			$ColorRect.visible=true
			$AnimationPlayer.play("Dialog")


func _on_NPC_L_mouse_entered():
	Input.set_default_cursor_shape(2)


func _on_NPC_L_mouse_exited():
	Input.set_default_cursor_shape(0)


func _on_Label2_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			$ColorRect.visible=false
			$NPC_L.playing = false
			
func _on_Schaukel_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			get_tree().change_scene("res://Szenen/Rocket_Horse_Building.tscn")# 


func _on_Quiz_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			get_tree().change_scene("res://Szenen/Quiz.tscn") # 


func _on_Schrnke_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			get_tree().change_scene("res://Szenen/Technikraum.tscn") # 
