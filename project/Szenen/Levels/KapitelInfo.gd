extends Sprite

var fehlerAufgaben = 0
var fehlerExperimente = 0


func ownInit():
	Myglobals.progressInfo = self
	
	
func fehlerAufgabe():
	fehlerAufgaben+=1
	
func fehlerExperiment():
	fehlerExperimente+=1
	
func progressMade():
	$ProgressBar.value +=3.1
	get_parent().get_node("Badges").checkBadge()

func save_this():
	var dict = { "fehlerAufg" : fehlerAufgaben, "fehlerExp": fehlerExperimente}
	return dict
	
func load_this(dict):
	fehlerAufgaben = dict["fehlerAufg"]
	fehlerExperimente = dict["fehlerExp"]
