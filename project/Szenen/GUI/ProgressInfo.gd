extends Sprite

var fehlerAufgaben = 0
var fehlerExperimente = 0


func ownInit():
	Myglobals.progressInfo = self
	
func fehlerAufgabe():
	fehlerAufgaben+=1
	$FehlerAufgCounter.text = str(fehlerAufgaben)
	
func fehlerExperiment():
	fehlerExperimente+=1
	$FehlerExpCounter.text = str(fehlerExperimente)
	
func progressMade():
	$ProgressBar.value +=2.5
