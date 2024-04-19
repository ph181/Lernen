extends Node2D
class_name CompositeSpriteAvatar


var currkopf 
var curroben
var curracc
var currhaare
var currunten

export var curr_acc: int = 0
export var curr_kopf: int = 0
export var curr_haare: int = 0
export var curr_oben: int = 0
export var curr_unten: int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func load_this(dict):
	curr_acc = dict["curr_acc"]
	curr_kopf = dict["curr_kopf"] 
	curr_haare = dict["curr_haare"] 
	curr_oben = dict["curr_oben"]
	curr_unten = dict["curr_unten"]
