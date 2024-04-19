extends Kapitel



export (PackedScene)  var Level1Class  = load("res://Szenen/Levels/AufgabenListe21.tscn")
export (PackedScene)   var Level2Class  = load ("res://Szenen/Levels/AufgabenListe22.tscn")
export (PackedScene)   var Level3Class  = load ("res://Szenen/Levels/AufgabenListe23.tscn")
export (PackedScene)   var Level4Class  = load ("res://Szenen/Levels/AufgabenListe24.tscn")
export (PackedScene)   var Level5Class  = load ("res://Szenen/Levels/AufgabenListe25.tscn")

export (Resource)  var Level1 
export (Resource)  var Level2 
export (Resource)  var Level3
export (Resource)  var Level4
export (Resource)  var Level5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


 
func loadLevels():

	if ResourceLoader.exists("res://Szenen/Levels/AufgabenListe21.tscn"):
		Level1Class = load("res://Szenen/Levels/AufgabenListe21.tscn")
	else:
		print("Die Datei existiert nicht.")
	if ResourceLoader.exists("res://Szenen/Levels/AufgabenListe22.tscn"):
		Level2Class = load("res://Szenen/Levels/AufgabenListe22.tscn")
	else:
		print("Die Datei AufgListe22.tscn existiert nicht.")
	if ResourceLoader.exists("res://Szenen/Levels/AufgabenListe23.tscn"):
		Level3Class = load("res://Szenen/Levels/AufgabenListe23.tscn")
	else:
		print("Die Datei AufgListe23.tscn existiert nicht.")
	if ResourceLoader.exists("res://Szenen/Levels/AufgabenListe24.tscn"):
		Level4Class = load("res://Szenen/Levels/AufgabenListe24.tscn")
	else:
		print("Die Datei AufgListe24.tscn existiert nicht.")
	if ResourceLoader.exists("res://Szenen/Levels/AufgabenListe25.tscn"):
		Level5Class = load("res://Szenen/Levels/AufgabenListe25.tscn")
	else:
		print("Die Datei AufgListe25.tscn existiert nicht.")
	
	Level1 = Level1Class.instance()
	Level1.own_init()
	Level2 = Level2Class.instance()
	Level2.own_init()
	Level3 = Level3Class.instance()
	Level3.own_init()
	Level4 = Level4Class.instance()
	Level4.own_init()
	Level5 = Level5Class.instance()
	Level5.own_init()
	
	
	levels = []
	levels.append(Level1)
	levels.append(Level2)
	levels.append(Level3)
	levels.append(Level4)
	levels.append(Level5)
	
	
	
func onLoad():
	$CurrentAufgabe.get_child(0).connectTableAufgaben()
	openLevel(currentLevel)
