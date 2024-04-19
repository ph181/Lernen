extends Aufgabenview

var K1A1class = load("res://Szenen/Levels/K1A1.tscn")
var K1a1
var K1A2class = load("res://Szenen/Levels/K1A2.tscn")
var K1a2
var K1A3class = load("res://Szenen/Levels/K1A3.tscn")
var K1a3
var K1A4class = load("res://Szenen/Levels/K1A4.tscn")
var K1a4
var K1A5class = load("res://Szenen/Levels/K1A5.tscn")
var K1a5
var K1A6class = load("res://Szenen/Levels/K1A6.tscn")
var K1a6
var K1A7class = load("res://Szenen/Levels/K1A7.tscn")
var K1a7
var K1A8class = load("res://Szenen/Levels/K1A8.tscn")
var K1a8
var K1A9class = load("res://Szenen/Levels/K1A9.tscn")
var K1a9
#var K1A10class = load("res://K1A10.tscn")
#var K1a10



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func my_init():
	
	K1a1 = K1A1class.instance()
	aufgabenKapitel.append(K1a1)
	K1a2 = K1A2class.instance()
	aufgabenKapitel.append(K1a2)
	K1a3 = K1A3class.instance()
	aufgabenKapitel.append(K1a3)
	K1a4 = K1A4class.instance()
	aufgabenKapitel.append(K1a4)
	K1a5 = K1A5class.instance()
	aufgabenKapitel.append(K1a5)
	K1a6 = K1A6class.instance()
	aufgabenKapitel.append(K1a6)
	K1a7 = K1A7class.instance()
	aufgabenKapitel.append(K1a7)
	K1a8 = K1A8class.instance()
	aufgabenKapitel.append(K1a8)
	K1a9 = K1A9class.instance()
	aufgabenKapitel.append(K1a9)

	
	load_previews()
	
	
func load_this(dict):
	.load_this(dict)
	
