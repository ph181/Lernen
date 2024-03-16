extends Node

var current_room
var inventory = []

func start():
	current_room = get_node("StartRoom")
	current_room.visited = true

func go_to_room(room_name):
	current_room.hide()
	current_room = get_node(room_name)
	current_room.show()
	if not current_room.visited:
		current_room.visited = true
		current_room.on_first_visit()

func pick_up(item_name):
	item = current_room.get_node(item_name)
	item.hide()
	inventory.append(item)

func use(item_name):
	item = None
	for i in inventory:
		if i.name == item_name:
			item = i
			break
	if item:
		item.use()
	else:
		print("Item not in inventory.")

In this engine, you'll need to create rooms as nodes with 
a unique name and create objects that can be picked up and used. 
To interact with the world, you can call the functions go_to_room(room_name), 
pick_up(item_name), and use(item_name). The on_first_visit() function in each 
room can be used to display text or perform other actions when the player enters 
a room for the first time.
