extends Node2D

const cutSprites = preload("res://Szenen/Avatar/cutscene.gd")
var nameValid = false

func ready():
	pass

func own_init():
	var paths = ["csacc", "csk", "csh", "cso"]
	var attributes = ["curr_acc", "curr_kopf", "curr_haare", "curr_oben"]
	var limits = [5, 6, 10, 8]

	for i in range(paths.size()):
		var path = paths[i]
		var attribute = attributes[i]
		var limit = limits[i]
		var curr_value = Myglobals.avatarNode[attribute]

		if curr_value <= limit:
			get_node(path).texture = load("res://Grafik/Avatar/cutscene/" + path + str(curr_value + 1) + ".png")

#extends Node2D
#
#
#const cutSprites = preload("res://Szenen/Avatar/cutscene.gd")
#
#
#
#var nameValid = false
#
#func ready():
#	pass
#
#
#
#func own_init():
#	if Myglobals.avatarNode.curr_acc == 0:
#		$csacc.texture = load("res://Grafik/Avatar/cutscene/csacc1.png")
#	elif Myglobals.avatarNode.curr_acc == 1:
#		$csacc.texture = load("res://Grafik/Avatar/cutscene/csacc2.png")
#	elif Myglobals.avatarNode.curr_acc == 2:
#		$csacc.texture = load("res://Grafik/Avatar/cutscene/csacc3.png")
#	elif Myglobals.avatarNode.curr_acc == 3:
#		$csacc.texture = load("res://Grafik/Avatar/cutscene/csacc4.png")	
#	elif Myglobals.avatarNode.curr_acc == 4:
#		$csacc.texture = load("res://Grafik/Avatar/cutscene/csacc5.png")
#
#	if Myglobals.avatarNode.curr_kopf == 0:
#		$csk.texture = load("res://Grafik/Avatar/cutscene/csk1.png")
#	elif Myglobals.avatarNode.curr_kopf == 1:
#		$csk.texture = load("res://Grafik/Avatar/cutscene/csk2.png")
#	elif Myglobals.avatarNode.curr_kopf == 2:
#		$csk.texture = load("res://Grafik/Avatar/cutscene/csk3.png")
#	elif Myglobals.avatarNode.curr_kopf == 3:
#		$csk.texture = load("res://Grafik/Avatar/cutscene/csk4.png")	
#	elif Myglobals.avatarNode.curr_kopf == 4:
#		$csk.texture = load("res://Grafik/Avatar/cutscene/csk5.png")
#	elif Myglobals.avatarNode.curr_kopf == 5:
#		$csk.texture = load("res://Grafik/intro/cutscene/csk6.png")
#
#	if Myglobals.avatarNode.curr_haare == 0:
#		$csh.texture = load("res://Grafik/intro/cutscene/csh1.png")
#	elif Myglobals.avatarNode.curr_haare == 1:
#		$csh.texture = load("res://Grafik/intro/cutscene/csh2.png")
#	elif Myglobals.avatarNode.curr_haare == 2:
#		$csh.texture = load("res://Grafik/intro/cutscene/csh3.png")
#	elif Myglobals.avatarNode.curr_haare == 3:
#		$csh.texture = load("res://Grafik/intro/cutscene/csh4.png")	
#	elif Myglobals.avatarNode.curr_haare == 4:
#		$csh.texture = load("res://Grafik/intro/cutscene/csh5.png")
#	elif Myglobals.avatarNode.curr_haare == 5:
#		$csh.texture = load("res://Grafik/intro/cutscene/csh6.png")
#	elif Myglobals.avatarNode.curr_haare == 6:
#		$csh.texture = load("res://Grafik/intro/cutscene/csh7.png")	
#	elif Myglobals.avatarNode.curr_haare == 7:
#		$csh.texture = load("res://Grafik/intro/cutscene/csh8.png")
#	elif Myglobals.avatarNode.curr_haare == 8:
#		$csh.texture = load("res://Grafik/intro/cutscene/csh9.png")
#	elif Myglobals.avatarNode.curr_haare == 9:
#		$csh.texture = load("res://Grafik/intro/cutscene/csh10.png")
#
#	if Myglobals.avatarNode.curr_oben == 0:
#		$cso.texture = load("res://Grafik/Avatar/cutscene/cso1.png")
#	elif Myglobals.avatarNode.curr_oben == 1:
#		$cso.texture = load("res://Grafik/intro/cutscene/cso2.png")
#	elif Myglobals.avatarNode.curr_oben == 2:
#		$cso.texture = load("res://Grafik/intro/cutscene/cso3.png")
#	elif Myglobals.avatarNode.curr_oben == 3:
#		$cso.texture = load("res://Grafik/intro/cutscene/cso4.png")	
#	elif Myglobals.avatarNode.curr_oben == 4:
#		$cso.texture = load("res://Grafik/intro/cutscene/cso5.png")
#	elif Myglobals.avatarNode.curr_oben == 5:
#		$cso.texture = load("res://Grafik/intro/cutscene/cso6.png")
#	elif Myglobals.avatarNode.curr_oben == 6:
#		$cso.texture = load("res://Grafik/intro/cutscene/cso7.png")	
#	elif Myglobals.avatarNode.curr_oben == 7:
#		$cso.texture = load("res://Grafik/intro/cutscene/cso8.png")
