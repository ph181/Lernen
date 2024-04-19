extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var compositeSprite
var finished = false

# Called when the node enters the scene tree for the first time.
func enterScene(_x):
	$roof_r1/cutsceneAvatar.own_init()
	$introsound.play()
	$roof_r1/AnimationPlayer.play("intro")

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(_anim_name):
	finished = true
	
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			SoundFx.buttonsound()
			if finished:
				get_tree().set_input_as_handled()
				Myglobals.gotoScene(GlobalScenes.House)
				
	




func _on_Control_mouse_exited():
	$Starten.scale = Vector2(0.6,0.6)
	
func _on_Control_mouse_entered():
	$Starten.scale = Vector2(0.7, 0.7)
