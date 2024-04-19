extends Module

#class_name Resistor

var resistance = 0.001
var voltage = 0

signal voltageChanged (v)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.





func _on_Control_gui_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == 1:
			visible = false


func _on_ResistanceSlider_value_changed(value):
	pass
	
func _on_VoltageSlider_value_changed(value):
	voltage = value
	$U.text  = ""
	$U.text  = "U: "+str( voltage) +" Volt"
	emit_signal("voltageChanged", value)
