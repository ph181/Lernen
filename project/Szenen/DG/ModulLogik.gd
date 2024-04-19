extends Node2D


func _ready():
	pass
	
func own_init():
	for m in get_child(0).get_children():
		m.myInit(Vector2(100,100), false, false)




	
