extends Node

func add_item(item):
	# Add the item sprite node to the inventory
	var new_item = load("res://" + item + ".tscn").instance()
	add_child(new_item)
	


func has_tools(tools):
	for tool in tools:
		if not get_node(tool):
			return false
	return true

func use_tool(tool):
	if get_node(tool):
		get_node(tool).queue_free()
		return true
	return false
