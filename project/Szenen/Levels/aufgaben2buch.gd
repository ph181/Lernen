extends Node2D

export var page_number : int 

func _on_TextureRect_gui_input(event):
	if event is InputEventMouseButton:
		Myglobals.gotoScene(GlobalScenes.BookScene)
		SoundFx.livingsound()
		GlobalScenes.BookScene.get_node("lit/AnimationPlayer/Blanco").goTo(page_number)
	
