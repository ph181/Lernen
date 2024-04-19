extends Kapitel

class_name Dachboden

export (PackedScene)  var Level1Class  = load("res://Szenen/Levels/AufgListe1.tscn")
export (PackedScene)   var Level2Class  = load ("res://Szenen/Levels/AufgListe2.tscn")
export (PackedScene)  var Level3Class  =  load("res://Szenen/Levels/AufgListe3.tscn")

export (Resource)  var Level1 
export (Resource)  var Level2 
export (Resource)  var Level3 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


 
func loadLevels():
	if ResourceLoader.exists("res://Szenen/Levels/AufgListe1.tscn"):
		Level1Class = load("res://Szenen/Levels/AufgListe1.tscn")
	else:
		print("Die Datei existiert nicht.")
	if ResourceLoader.exists("res://Szenen/Levels/AufgListe2.tscn"):
		Level2Class = load("res://Szenen/Levels/AufgListe2.tscn")
	else:
		print("Die Datei AufgListe2.tscn existiert nicht.")
	if ResourceLoader.exists("res://Szenen/Levels/AufgListe3.tscn"):
		Level3Class = load("res://Szenen/Levels/AufgListe3.tscn")
	else:
		print("Die Datei AufgListe3.tscn existiert nicht.")

		
	Level1 = Level1Class.instance()
	Level1.own_init()
	Level2 = Level2Class.instance()
	Level2.own_init()
	Level3 = Level3Class.instance()
	Level3.own_init()
	levels = []
	levels.append(Level1)
	levels.append(Level2)
	levels.append(Level3)
	
	
func onLoad():
	$CurrentAufgabe.get_child(0).connectTableAufgaben()
	openLevel(currentLevel)


