extends Node2D




func ready():
	$TextureRect.visible = false


func _on_TextureRect_gui_input(event):
	if event is InputEventMouseButton:
		var a = []
		for af in get_parent().get_node("tasks").get_children():
			if af.has_node("myTask/SquareTask/Sprite"):
				if af.get_node("myTask/SquareTask/Sprite") != null:
					var cp = af.get_node("myTask/SquareTask/Sprite").duplicate()
					cp.position = Vector2(0,0)
					a.append(cp)
					
					
		if a.size() == 0:
			if get_parent().get_node("Sprite") != null:
				var cp = get_parent().get_node("Sprite").duplicate()
				cp.position = Vector2(0,0)
				a.append(cp)
				
		get_tree().set_input_as_handled()
		GlobalScenes.freeExpLvl.set_Aufgaben(a)
		Myglobals.gotoScene(GlobalScenes.currentChapter)
		GlobalScenes.currentChapter.openLevelFree()
