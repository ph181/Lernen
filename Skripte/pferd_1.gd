extends Sprite


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_pferd_1_body_entered(body):
	if body.name == "fuchs":
		get_tree().queue_delete(self)
		get_parent().get_node("pferd_2").visible = true
		deckelaktiv()
		
func deckelaktiv():
	get_parent().get_node("pferd_2/pferd_2/feile").set_deferred("disabled", false)

