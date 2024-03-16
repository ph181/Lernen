extends Node2D

func _ready():
	$pferd_3.visible = false
	$pferd_2.visible = false
	$done.visible = false
	get_node("pferd_3/pferd_3/schrauben").set_deferred("disabled", true)
	get_node("pferd_2/pferd_2/feile").set_deferred("disabled", true)	



func _on_close_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			get_tree().change_scene("res://Szenen/Klassenzimmer.tscn") # 




