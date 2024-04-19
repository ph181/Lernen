extends Aufgabenview

var K3A1class = load("res://Szenen/Levels/K3A1.tscn")
var K3a1
var K3A2class = load("res://Szenen/Levels/K3A2.tscn")
var K3a2
var K3A3class = load("res://Szenen/Levels/K3A3.tscn")
var K3a3
var K3A4class = load("res://Szenen/Levels/K3A4.tscn")
var K3a4
var K3A5class = load("res://Szenen/Levels/K3A5.tscn")
var K3a5
var K3A6class = load("res://Szenen/Levels/K3A6.tscn")
var K3a6
var K3A7class = load("res://Szenen/Levels/K3A7.tscn")
var K3a7
#var K3A8class = load("res://K3A8.tscn")
#var K3a8
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func my_init():
	K3a1 = K3A1class.instance()
	aufgabenKapitel.append(K3a1)
	K3a2 = K3A2class.instance()
	aufgabenKapitel.append(K3a2)
	K3a3 = K3A3class.instance()
	aufgabenKapitel.append(K3a3)
	K3a4 = K3A4class.instance()
	aufgabenKapitel.append(K3a4)
	K3a5 = K3A5class.instance()
	aufgabenKapitel.append(K3a5)
	K3a6 = K3A6class.instance()
	aufgabenKapitel.append(K3a6)
	K3a7 = K3A7class.instance()
	aufgabenKapitel.append(K3a7)
#	K3a8 = K3A8class.instance()
#	aufgabenKapitel.append(K3a8)

	load_previews()

func load_this(dict):
	.load_this(dict)
