extends Node



func _ready():
	# when _ready is called, there might already be nodes in the tree, so connect all existing buttons
	pass

func buttonsound():
	$button.play()


func cablesound():
	$cable.play()

func correctsound():
	$correct.play()

func wrongsound():
	$wrong.play()

func stairssound():
	$stairs.play()

func pagesound():
	$page.play()

func childsound():
	$child.play()	

func roofsound():
	$roof.play()	

func livingsound():
	$living.play()

func checksound():
	$check.play()

func chaptersound():
	$chapter.play()


#	connect_buttons(get_tree().root)
#	get_tree().connect("node_added", self, "_on_SceneTree_node_added")



#func _on_SceneTree_node_added(node):
#	if node is Button:
#		connect_to_button(node)

#func _on_Button_pressed():
#	$ButtonSound.play()
#
## recursively connect all buttons
#func connect_buttons(root):
#	for child in root.get_children():
#		if child is BaseButton:
#			connect_to_button(child)
#		connect_buttons(child)
#
#func connect_to_button(button):
#	button.connect("pressed", self, "_on_Button_pressed")
