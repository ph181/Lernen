extends Node2D


func giveStars(fehler):
	if (fehler == 0):
		$Gift/star1.visible = true
		$Gift/star2.visible = true
		$Gift/star3.visible = true
		
	elif (fehler <3):
		$Gift/star1.visible = true
		$Gift/star2.visible = true
		$Gift/star3.visible = false
		
	else:
		$Gift/star1.visible = true
		$Gift/star2.visible = false
		$Gift/star3.visible = false
	$Gift/Label2.text = str( fehler)+" Fehler"
	$Gift/AnimationPlayer.play("newGift (copy)")
