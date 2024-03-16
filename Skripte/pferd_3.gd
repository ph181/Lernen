extends Sprite


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_pferd_3_body_entered(body):
	if body.name == "torx":
		get_tree().queue_delete(self)
		get_parent().get_node("done").visible = true

		



