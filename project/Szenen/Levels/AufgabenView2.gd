extends Aufgabenview


var K2A1class = load("res://Szenen/Levels/K2A1.tscn")
var K2a1
var K2A2class = load("res://Szenen/Levels/K2A2.tscn")
var K2a2
var K2A3class = load("res://Szenen/Levels/K2A3.tscn")
var K2a3
var K2A4class = load("res://Szenen/Levels/K2A4.tscn")
var K2a4
var K2A5class = load("res://Szenen/Levels/K2A5.tscn")
var K2a5
var K2A6class = load("res://Szenen/Levels/K2A6.tscn")
var K2a6
#var K2A7class = load("res://K2A7.tscn")
#var K2a7
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func my_init():
	
	K2a1 = K2A1class.instance()
	aufgabenKapitel.append(K2a1)
	K2a2 = K2A2class.instance()
	aufgabenKapitel.append(K2a2)
	K2a3 = K2A3class.instance()
	aufgabenKapitel.append(K2a3)
	K2a4 = K2A4class.instance()
	aufgabenKapitel.append(K2a4)
	K2a5 = K2A5class.instance()
	aufgabenKapitel.append(K2a5)
	K2a6 = K2A6class.instance()
	aufgabenKapitel.append(K2a6)
#	K2a7 = K2A7class.instance()
#	aufgabenKapitel.append(K2a7)	
	load_previews()

func load_this(dict):
	.load_this(dict)
