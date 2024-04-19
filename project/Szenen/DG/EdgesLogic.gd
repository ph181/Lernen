extends Node

var edgeSzene = load( "res://Szenen/DG/EdgeLine.tscn" )
var knodeSzene = load( "res://Szenen/DG/Knode.tscn" )

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func own_init():
	for e in get_children():
		e.own_init(self, null, false)
	
