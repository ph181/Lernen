extends VBoxContainer

func _ready():
	pass # Replace with function body.



func _on_elektrischerStromkreis_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == 1:
				get_parent().gotopage(3)



func _on_Kurzschluss_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == 1:
				get_parent().gotopage(5)

func _on_Elektrizitaetsquellen_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == 1:
				get_parent().gotopage(7)


func _on_Symbole_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == 1:
				get_parent().gotopage(9)


func _on_Stromstaerke_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == 1:
				get_parent().gotopage(11)


func _on_Amperemeter_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == 1:
				get_parent().gotopage(13)


func _on_Reihenschaltung_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == 1:
				get_parent().gotopage(15)


func _on_Potenzial_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == 1:
				get_parent().gotopage(17)


func _on_Spannung_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == 1:
				get_parent().gotopage(19)


func _on_Voltmeter_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == 1:
				get_parent().gotopage(21)


func _on_Parallelschaltungen_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == 1:
				get_parent().gotopage(23)


func _on_Mschenregel_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == 1:
				get_parent().gotopage(25)


func _on_Knotenregel_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == 1:
				get_parent().gotopage(27)

func _on_elektrischerStromkreis_mouse_entered():
	$elektrischerStromkreis.add_color_override("font_color", Color("#39c031"))

func _on_elektrischerStromkreis_mouse_exited():
	$elektrischerStromkreis.add_color_override("font_color", Color("#000000"))

func _on_Kurzschluss_mouse_entered():
	$Kurzschluss.add_color_override("font_color", Color("#39c031"))

func _on_Kurzschluss_mouse_exited():
	$Kurzschluss.add_color_override("font_color", Color("#000000"))

func _on_Elektrizitaetsquellen_mouse_entered():
	$Elektrizitaetsquellen.add_color_override("font_color", Color("#39c031"))

func _on_Elektrizitaetsquellen_mouse_exited():
	$Elektrizitaetsquellen.add_color_override("font_color", Color("#000000"))
	
func _on_Symbole_mouse_entered():
	$Symbole.add_color_override("font_color", Color("#39c031"))

func _on_Symbole_mouse_exited():
	$Symbole.add_color_override("font_color", Color("#000000"))

func _on_Stromstaerke_mouse_entered():
	$Stromstaerke.add_color_override("font_color", Color("#39c031"))

func _on_Stromstaerke_mouse_exited():
	$Stromstaerke.add_color_override("font_color", Color("#000000"))

func _on_Amperemeter_mouse_entered():
	$Amperemeter.add_color_override("font_color", Color("#39c031"))

func _on_Amperemeter_mouse_exited():
	$Amperemeter.add_color_override("font_color", Color("#000000"))

func _on_Reihenschaltung_mouse_entered():
	$Reihenschaltung.add_color_override("font_color", Color("#39c031"))

func _on_Reihenschaltung_mouse_exited():
	$Reihenschaltung.add_color_override("font_color", Color("#000000"))

func _on_Potenzial_mouse_entered():
	$Potenzial.add_color_override("font_color", Color("#39c031"))

func _on_Potenzial_mouse_exited():
	$Potenzial.add_color_override("font_color", Color("#000000"))

func _on_Spannung_mouse_entered():
	$Spannung.add_color_override("font_color", Color("#39c031"))

func _on_Spannung_mouse_exited():
	$Spannung.add_color_override("font_color", Color("#000000"))

func _on_Voltmeter_mouse_entered():
	$Voltmeter.add_color_override("font_color", Color("#39c031"))

func _on_Voltmeter_mouse_exited():
	$Voltmeter.add_color_override("font_color", Color("#000000"))

func _on_Parallelschaltungen_mouse_entered():
	$Parallelschaltungen.add_color_override("font_color", Color("#39c031"))

func _on_Parallelschaltungen_mouse_exited():
	$Parallelschaltungen.add_color_override("font_color", Color("#000000"))

func _on_Mschenregel_mouse_entered():
	$Mschenregel.add_color_override("font_color", Color("#39c031"))

func _on_Mschenregel_mouse_exited():
	$Mschenregel.add_color_override("font_color", Color("#000000"))

func _on_Knotenregel_mouse_entered():
	$Knotenregel.add_color_override("font_color", Color("#39c031"))

func _on_Knotenregel_mouse_exited():
	$Knotenregel.add_color_override("font_color", Color("#000000"))



