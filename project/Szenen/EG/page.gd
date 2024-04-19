extends Node2D

var pageNr

func _ready():
	pageNr= get_position_in_parent() +1
	if pageNr % 2 == 0:
		position.x = 648
		$Inhalt.visible = false
	$pageNr.text = "- "+str(pageNr)+" -"
	
func fadeIn():
	if $AnimationPlayer.is_playing():
		$AnimationPlayer.stop(true)
	$AnimationPlayer.play("fadeIn")
	
func fadeOut():
	if $AnimationPlayer.is_playing():
		$AnimationPlayer.stop(true)
	$AnimationPlayer.play("fadeOut")

func fadeInv():
	if $AnimationPlayer.is_playing():
		$AnimationPlayer.stop(true)
	$AnimationPlayer.play("fadeOutInv")

func fadeDirect():
	if $AnimationPlayer.is_playing():
		$AnimationPlayer.stop(true)
	$AnimationPlayer.play("fadeIndirect")

func gotopage(nr):
	var blanco = get_parent().get_parent().get_node("Blanco")
	blanco.goTo(nr)
	


func _on_Inhalt_gui_input(event):
	if event is InputEventMouseButton:
		if pageNr == 1 or pageNr ==0:
			return
		var blanco = get_parent().get_parent().get_node("Blanco")
		blanco.goTo(1)



func _on_TextureRect2_mouse_entered():
	$AnimatedSprite.play()

func _on_TextureRect2_mouse_exited():
	
	if $AnimatedSprite.is_playing():
			$AnimatedSprite.stop()
