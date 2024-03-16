extends Control

var inventory = Inventory.new()

func _process(delta):
	if Input.is_action_just_pressed("ui_open_inventory"):
		# Show the inventory UI
		pass

func _show_inventory():
	# Show the items in the inventory and handle player interaction
	pass
