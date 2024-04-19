extends Node2D

var acc 
var kopf 
var haare
var oben 
var unten 
var rand = RandomNumberGenerator.new()

const alleSprites = preload("res://Szenen/Avatar/alleSprites.gd")

export var curr_acc: int = 0
export var curr_kopf: int = 0
export var curr_haare: int = 0
export var curr_oben: int = 0
export var curr_unten: int = 0

var nameValid = false

func ready():
	own_init()

func enterScene(_lastScene):
	
	$Name.grab_click_focus()
	$Name.call_deferred("grab_focus")
	
	
func own_init():
	acc = $CompositeSprites/acc
	kopf = $CompositeSprites/kopf
	haare = $CompositeSprites/haare
	oben = $CompositeSprites/oben
	unten = $CompositeSprites/unten
	rand.randomize()
	curr_acc = rand.randi_range(0,alleSprites.accs.size()-1)
	curr_haare = rand.randi_range(0,alleSprites.haares.size()-1)
	curr_kopf = rand.randi_range(0,alleSprites.kopfs.size()-1)
	curr_oben = rand.randi_range(0,alleSprites.obens.size()-1)
	curr_unten = rand.randi_range(0,alleSprites.untens.size()-1)
	
	acc.texture = alleSprites.accs[curr_acc]
	haare.texture = alleSprites.haares[curr_haare] 
	kopf.texture = alleSprites.kopfs[curr_kopf]
	oben.texture = alleSprites.obens[curr_oben]
	unten.texture = alleSprites.untens[curr_unten]
	
	
	
func _on_kl_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			for _i in range (alleSprites.kopfs.size()-1,0,-1):
				curr_kopf = (curr_kopf + 1) % alleSprites.kopfs.size()
				kopf.texture = alleSprites.kopfs[curr_kopf]

func _on_kl_mouse_entered():
	get_node("Körper/arrowl").scale.x = 1.2
	get_node("Körper/arrowl").scale.y = 1.2

func _on_kl_mouse_exited():
	get_node("Körper/arrowl").scale.x = 1
	get_node("Körper/arrowl").scale.y = 1

func _on_kr_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			curr_kopf = (curr_kopf + 1) % alleSprites.kopfs.size()
			kopf.texture = alleSprites.kopfs[curr_kopf]

func _on_kr_mouse_entered():
	get_node("Körper/arrowr").scale.x = 1.2
	get_node("Körper/arrowr").scale.y = 1.2

func _on_kr_mouse_exited():
	get_node("Körper/arrowr").scale.x = 1
	get_node("Körper/arrowr").scale.y = 1

func _on_hl_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			for _i in range (alleSprites.haares.size()-1,0,-1): 
				curr_haare = (curr_haare+1) % alleSprites.haares.size()
				haare.texture = alleSprites.haares[curr_haare]

func _on_hl_mouse_entered():
	get_node("Haare/arrowl").scale.x = 1.2
	get_node("Haare/arrowl").scale.y = 1.2

func _on_hl_mouse_exited():
	get_node("Haare/arrowl").scale.x = 1
	get_node("Haare/arrowl").scale.y = 1
	
func _on_hr_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			curr_haare = (curr_haare +1) % alleSprites.haares.size()
			haare.texture = alleSprites.haares[curr_haare]

func _on_hr_mouse_entered():
	get_node("Haare/arrowr").scale.x = 1.2
	get_node("Haare/arrowr").scale.y = 1.2

func _on_hr_mouse_exited():
	get_node("Haare/arrowr").scale.x = 1
	get_node("Haare/arrowr").scale.y = 1

func _on_ol_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			for _i in range (alleSprites.obens.size()-1,0,-1): 
				curr_oben = (curr_oben + 1) % alleSprites.obens.size()
				oben.texture = alleSprites.obens[curr_oben]

func _on_ol_mouse_entered():
	get_node("Oben/arrowl").scale.x = 1.2
	get_node("Oben/arrowl").scale.y = 1.2

func _on_ol_mouse_exited():
	get_node("Oben/arrowl").scale.x = 1
	get_node("Oben/arrowl").scale.y = 1

func _on_or_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			curr_oben = (curr_oben + 1) % alleSprites.obens.size()
			oben.texture = alleSprites.obens[curr_oben]

func _on_or_mouse_entered():
	get_node("Oben/arrowr").scale.x = 1.2
	get_node("Oben/arrowr").scale.y = 1.2

func _on_or_mouse_exited():
	get_node("Oben/arrowr").scale.x = 1
	get_node("Oben/arrowr").scale.y = 1

func _on_ul_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			for _i in range (alleSprites.untens.size()-1,0,-1): 
				curr_unten = (curr_unten +1) % alleSprites.untens.size()
				unten.texture = alleSprites.untens[curr_unten]

func _on_ul_mouse_entered():
	get_node("Unten/arrowl").scale.x = 1.2
	get_node("Unten/arrowl").scale.y = 1.2

func _on_ul_mouse_exited():
	get_node("Unten/arrowl").scale.x = 1
	get_node("Unten/arrowl").scale.y = 1

func _on_ur_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			curr_unten = (curr_unten + 1) % alleSprites.untens.size()
			unten.texture = alleSprites.untens[curr_unten]

func _on_ur_mouse_entered():
	get_node("Unten/arrowr").scale.x = 1.2
	get_node("Unten/arrowr").scale.y = 1.2

func _on_ur_mouse_exited():
	get_node("Unten/arrowr").scale.x = 1
	get_node("Unten/arrowr").scale.y = 1

func _on_el_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			for _i in range (alleSprites.haares.size()-1,0,-1): 
				curr_acc = (curr_acc +1) % alleSprites.accs.size()
				acc.texture = alleSprites.accs[curr_acc]

func _on_el_mouse_entered():
	get_node("Extras/arrowl").scale.x = 1.2
	get_node("Extras/arrowl").scale.y = 1.2

func _on_el_mouse_exited():
	get_node("Extras/arrowl").scale.x = 1
	get_node("Extras/arrowl").scale.y = 1

func _on_er_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			curr_acc = (curr_acc + 1) % alleSprites.accs.size()
			acc.texture = alleSprites.accs[curr_acc]

func _on_er_mouse_entered():
	get_node("Extras/arrowr").scale.x = 1.2
	get_node("Extras/arrowr").scale.y = 1.2

func _on_er_mouse_exited():
	get_node("Extras/arrowr").scale.x = 1
	get_node("Extras/arrowr").scale.y = 1
# weiter btn§
func _on_weiter_clicked(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			
			saveNodes()
			$CompositeSprites.curr_acc = curr_acc
			$CompositeSprites.curr_haare = curr_haare
			$CompositeSprites.curr_kopf = curr_kopf
			$CompositeSprites.curr_oben = curr_oben
			$CompositeSprites.curr_unten = curr_unten
			
			Myglobals.avatarNode = $CompositeSprites
			remove_child($CompositeSprites)
			GlobalScenes.House.add_child(Myglobals.avatarNode)
			Myglobals.avatarNode.position.x = 1160
			Myglobals.avatarNode.position.y = 270
			$Name.text = $Name.text.replace(" ", "")
			GlobalScenes.House.get_node("ProgressInfo/Name").text = $Name.text
			Myglobals.avatarNode.scale.x = -1
			Myglobals.avatarNode.scale.y = 1
			
			Myglobals.gameInNewState = false
			
			Myglobals.gotoScene(GlobalScenes.introScene)
			Saver.sendSave()


func saveNodes():
	$CompositeSprites.curracc = curr_acc
	$CompositeSprites.currhaare = curr_haare
	$CompositeSprites.currkopf = curr_kopf
	$CompositeSprites.curroben = curr_oben
	$CompositeSprites.currunten = curr_unten

func _on_zurueck_clicked(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			Myglobals.gotoScene(GlobalScenes.MainMenu)

func _on_Name_text_entered(_new_text):
	if $Name.text.length() >18:
		$Name.text = $Name.text.substr(0,19)
	else:
		for _i in range((18-$Name.text.length() )/2 +1):
			$Name.text = " " +$Name.text
	
		
		
func _on_Control_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			curr_acc = rand.randi_range(0,alleSprites.accs.size()-1)
			curr_haare = rand.randi_range(0,alleSprites.haares.size()-1)
			curr_kopf = rand.randi_range(0,alleSprites.kopfs.size()-1)
			curr_oben = rand.randi_range(0,alleSprites.obens.size()-1)
			curr_unten = rand.randi_range(0,alleSprites.untens.size()-1)
	
			acc.texture = alleSprites.accs[curr_acc]
			haare.texture = alleSprites.haares[curr_haare] 
			kopf.texture = alleSprites.kopfs[curr_kopf]
			oben.texture = alleSprites.obens[curr_oben]
			unten.texture = alleSprites.untens[curr_unten]

func _on_Control_mouse_entered():
	get_node("Randomizer/Sprite").scale.x = 1.2
	get_node("Randomizer/Sprite").scale.y = 1.2

func _on_Control_mouse_exited():
	get_node("Randomizer/Sprite").scale.x = 1
	get_node("Randomizer/Sprite").scale.y = 1


func _on_Name_text_changed(new_text):
	if new_text.length() >1:
		nameValid =true
		$Weiter.visible=true
	else:
		nameValid =false
		$Weiter.visible=false

func save_this():
	var dict = {}
	dict["curr_acc"] = curr_acc
	dict["curr_kopf"] = curr_kopf
	dict["curr_haare"] = curr_haare
	dict["curr_oben"] = curr_oben
	dict["curr_unten"] = curr_unten
	return dict
