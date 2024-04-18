extends Sprite2D

#var area
#var tool
#var sprite
#
#func _ready():
#	for i in range(3):
##		area = get_node("pferd" + str(i+1) + "/area")
#		area = get_node("area")
#		area.body_entered.connect(_on_body_entered.bind(i))
#
#
#func _on_body_entered(body,i):
#	tool = get_node("tool" + str(i+1) + "/tool")
#	sprite = get_node("pferd" + str(i))
#	if body.name == tool:
#		get_tree().queue_delete(sprite)
#		get_parent().get_node("done").visible = true
