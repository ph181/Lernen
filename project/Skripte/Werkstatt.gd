extends Node2D

var werkzeuge = {
	"Japansäge": "Schneide das Hartholz",
	"Laubsäge": "Schneide eine Kurve in das Holz",
	"Metallsäge": "Schneide das Metallrohr",
	"Feinsäge": "Schneide das dünne Holz",
	"Kombizange": "Kombiniert halten und schneiden",
	"Rohrzange": "Drehe das Rohr",
	"Rundzange": "Biege den Draht",
	"Seitenschneider": "Schneide den Draht",
	"Heißkleber": "Klebe die Teile zusammen",
	"Holzleim": "Klebe das Holz zusammen",
	"Schraubzwingen": "Fixiere ein Werkstück",
	"Torx Schraubenzieher": "Drehe die Torxschrauben",
	"Stichsäge": "Schneide ein komplexes Muster",
	"Standbohrmaschine": "Bohre ein Loch in das Metall",
	"Dekupiersäge": "Schneide ein komplexes Muster",
	"Akkuschrauber": "Bohren und Schrauben",
	"Raspel": "Entferne Kanten vom Holz",
	"Feile": "Glätte das Holz"
} # Ihr Wörterbuch der Werkzeuge und Aufgaben
var aktuelleAufgabe = ""
var werkzeugNodes = [] # Liste der Werkzeug-Nodes

func _ready():
	for i in range(18): # Füllen Sie die Liste mit Ihren Werkzeug-Nodes
		werkzeugNodes.append(get_node("TextureButton" + str(i)))
	aktuelleAufgabe = werkzeuge.values()[randi() % werkzeuge.size()] # Wählen Sie eine zufällige Aufgabe
	$Label.text = aktuelleAufgabe

	
	
func _input(event):
	for i in range(werkzeugNodes.size()):
		if event is InputEventMouseButton and event.pressed and werkzeugNodes[i].get_rect().has_point(event.position):
			_on_Werkzeug_pressed(werkzeuge.keys()[i]) # Ersetzen Sie "Feinsäge" durch den Namen des Werkzeugs

func _on_Werkzeug_pressed(werkzeug):
	if werkzeuge[werkzeug] == aktuelleAufgabe:
		$AusgabeLabel.text = "Richtig!"
	else:
		$AusgabeLabel.text = "Falsch! Das richtige Werkzeug für " + aktuelleAufgabe + " ist nicht " + werkzeug
	aktuelleAufgabe = werkzeuge.values()[randi() % werkzeuge.size()] # Wählen Sie eine neue Aufgabe
	$Label.text = aktuelleAufgabe
