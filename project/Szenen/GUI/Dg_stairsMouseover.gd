extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AreaKiZi2_mouse_entered():
	Input.set_default_cursor_shape(2)
	$CollisionPolygon2D/Sprite.visible = true
	$CollisionPolygon2D/Sprite2.visible = true

func _on_AreaKiZi2_mouse_exited():
	Input.set_default_cursor_shape(0)
	$CollisionPolygon2D/Sprite.visible = false
	$CollisionPolygon2D/Sprite2.visible = false


func _on_AreaKiZi3_mouse_entered():
	Input.set_default_cursor_shape(2)
	$CollisionPolygon2D/Sprite.visible = true
	$CollisionPolygon2D/Sprite2.visible = true


func _on_AreaKiZi3_mouse_exited():
	Input.set_default_cursor_shape(0)
	$CollisionPolygon2D/Sprite.visible = false
	$CollisionPolygon2D/Sprite2.visible = false

