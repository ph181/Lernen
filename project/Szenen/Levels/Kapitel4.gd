extends Kapitel


export (PackedScene)  var Level1Class  = load("res://Szenen/Levels/AufgabenListe41.tscn")
export (PackedScene)   var Level2Class  = load ("res://Szenen/Levels/AufgabenListe42.tscn")
export (PackedScene)   var Level3Class  = load ("res://Szenen/Levels/AufgabenListe43.tscn")
export (PackedScene)   var Level4Class  = load ("res://Szenen/Levels/AufgabenListe44.tscn")
export (PackedScene)   var Level5Class  = load ("res://Szenen/Levels/AufgabenListe45.tscn")

export (Resource)  var Level1 
export (Resource)  var Level2 
export (Resource)  var Level3
export (Resource)  var Level4
export (Resource)  var Level5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


 
func loadLevels():
	
	if ResourceLoader.exists("res://Szenen/Levels/AufgabenListe41.tscn"):
		Level1Class = load("res://Szenen/Levels/AufgabenListe41.tscn")
	else:
		print("Die Datei existiert nicht.")
	if ResourceLoader.exists("res://Szenen/Levels/AufgabenListe42.tscn"):
		Level2Class = load("res://Szenen/Levels/AufgabenListe42.tscn")
	else:
		print("Die Datei AufgListe2.tscn existiert nicht.")
	if ResourceLoader.exists("res://Szenen/Levels/AufgabenListe43.tscn"):
		Level3Class = load("res://Szenen/Levels/AufgabenListe43.tscn")
	else:
		print("Die Datei AufgListe3.tscn existiert nicht.")
	if ResourceLoader.exists("res://Szenen/Levels/AufgabenListe44.tscn"):
		Level4Class = load("res://Szenen/Levels/AufgabenListe44.tscn")
	else:
		print("Die Datei AufgListe3.tscn existiert nicht.")	
	if ResourceLoader.exists("res://Szenen/Levels/AufgabenListe45.tscn"):
		Level5Class = load("res://Szenen/Levels/AufgabenListe45.tscn")
	else:
		print("Die Datei AufgListe3.tscn existiert nicht.")
		
		
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
