extends Node



var flowStars = {}



func _ready():
	pass # Replace with function body.



func starGiven(key, stars, timeshown):
	flowStars[str(key)] = [stars,timeshown]
	print(flowStars)

func save_this():
	return flowStars

func load_this(dict):
	var k = dict.keys()
	for i in k:
		flowStars[i]= dict[i]
	
