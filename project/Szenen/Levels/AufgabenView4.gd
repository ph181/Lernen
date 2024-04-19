extends Aufgabenview


var K4A1class = load("res://Szenen/Levels/K4A1.tscn")
var K4a1
var K4A2class = load("res://Szenen/Levels/K4A2.tscn")
var K4a2
var K4A3class = load("res://Szenen/Levels/K4A3.tscn")
var K4a3
var K4A4class = load("res://Szenen/Levels/K4A4.tscn")
var K4a4
var K4A5class = load("res://Szenen/Levels/K4A5.tscn")
var K4a5
var K4A6class = load("res://Szenen/Levels/K4A6.tscn")
var K4a6
var K4A7class = load("res://Szenen/Levels/K4A7.tscn")
var K4a7
#var K4A8class = load("res://K4A8.tscn")
#var K4a8
#var K4A9class = load("res://K4A9.tscn")
#var K4a9


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func my_init():
	
	K4a1 = K4A1class.instance()
	aufgabenKapitel.append(K4a1)
	K4a2 = K4A2class.instance()
	aufgabenKapitel.append(K4a2)
	K4a3 = K4A3class.instance()
	aufgabenKapitel.append(K4a3)
	K4a4 = K4A4class.instance()
	aufgabenKapitel.append(K4a4)
	K4a5 = K4A5class.instance()
	aufgabenKapitel.append(K4a5)
	K4a6 = K4A6class.instance()
	aufgabenKapitel.append(K4a6)
	K4a7 = K4A7class.instance()
	aufgabenKapitel.append(K4a7)
#	K4a8 = K4A8class.instance()
#	aufgabenKapitel.append(K4a8)
#	K4a9 = K4A9class.instance()
#	aufgabenKapitel.append(K4a9)

	load_previews()

func load_this(dict):
	.load_this(dict)
