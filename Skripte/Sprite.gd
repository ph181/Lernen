extends Sprite

func _on_Tool_mouse_entered():
	get_tree().change_scene("res://Inventory.tscn")
	get_node("Inventory").add_item(get_name())
