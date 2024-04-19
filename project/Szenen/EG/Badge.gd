extends Control

class_name Badge

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setTex(texture, txt):
	$Sprite.texture = texture
	$Label.text = txt
