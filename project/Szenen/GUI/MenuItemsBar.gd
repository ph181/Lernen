extends Sprite

var voltmeterclass = load("res://Szenen/DG/InvertedAmpermeter.tscn")
var resistorclass = load("res://Szenen/DG/Resistor.tscn")
var isUp = true

func _ready():
	pass # Replace with function body.

func _process(_delta):
	if Myglobals.chaptersUnlocked >0:
		$Ampermeter.modulate.a = 255
		$Voltometer.modulate.a = 255
		$Resistor.modulate.a = 255
	
	
func _on_Arrow_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if !isUp:
				$AnimationPlayer.play("menuUp")
				isUp= true
				$ArrowUpDown.visible = false
			else:
				$AnimationPlayer.play_backwards("menuUp")
				isUp= false
				$ArrowUpDown.visible = true


func _on_newCable_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if event.is_pressed():
				for c in Myglobals.allEdgesBase.get_children():
					if c.drag:
						return
				var newCable = Myglobals.macheNeueKabel(get_viewport().get_mouse_position(),true)
				newCable.connectedKnodes[0].position.x+=30
				newCable.connectedKnodes[1].position.x-=30
				newCable.connectedKnodes[0].position.y+=36
				newCable.connectedKnodes[1].position.y-=36


func _on_newBattery_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if event.is_pressed():
				for c in Myglobals.allModulesBase.get_children():
					if c.drag:
						return
				Myglobals.macheNeuesModul(get_viewport().get_mouse_position(),Myglobals.ModulTypes.Battery)


func _on_newLamp_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if event.is_pressed():
				for c in Myglobals.allModulesBase.get_children():
					if c.drag:
						return
				Myglobals.macheNeuesModul(get_viewport().get_mouse_position(),Myglobals.ModulTypes.Lamp)


func _on_newAmpermeter_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if event.is_pressed():
				for c in Myglobals.allModulesBase.get_children():
					if c.drag:
						return
				if Myglobals.chaptersUnlocked >0:
					Myglobals.macheNeuesModul(get_viewport().get_mouse_position(),Myglobals.ModulTypes.Ampermeter)


func _on_new_Voltometer_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index==1 and event.is_pressed():
			for c in Myglobals.allModulesBase.get_children():
					if c.drag:
						return
			if Myglobals.chaptersUnlocked >0:
				Myglobals.macheNeuesModul(get_viewport().get_mouse_position(),Myglobals.ModulTypes.Voltmeter)


func _on_newResistor_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if event.is_pressed():
				for c in Myglobals.allModulesBase.get_children():
					if c.drag:
						return
				if Myglobals.chaptersUnlocked >0:
					Myglobals.macheNeuesModul(get_viewport().get_mouse_position(),Myglobals.ModulTypes.Resistor)


func _on_newCable_mouse_entered():
	$Cable/Label.visible = true

func _on_newCable_mouse_exited():
	$Cable/Label.visible = false

func _on_newBattery_mouse_entered():
	$Battery/Label.visible = true

func _on_newBattery_mouse_exited():
	$Battery/Label.visible = false

func _on_newLamp_mouse_entered():
	$Lamp/Label.visible = true

func _on_newLamp_mouse_exited():
	$Lamp/Label.visible = false

func _on_new_Voltometer_mouse_entered():
	$Voltometer/Label.visible = true

func _on_new_Voltometer_mouse_exited():
	$Voltometer/Label.visible = false

func _on_newAmpermeter_mouse_entered():
	$Ampermeter/Label.visible = true
	
func _on_newAmpermeter_mouse_exited():
	$Ampermeter/Label.visible = false

func _on_newResistor_mouse_entered():
	$Resistor/Label.visible = true

func _on_newResistor_mouse_exited():
	$Resistor/Label.visible = false
