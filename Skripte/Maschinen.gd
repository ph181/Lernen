extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	$Stichsaege_open.visible = false
#	$Dekupiersaege_open.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	pass
func _on_Stichsaege_close_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			$Stichsaege_open/tool.visible = true
func _on_Stichsaege_open_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			$Stichsaege_open/tool.visible = false

func _on_Dekupiersaege_open_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			$Dekupiersaege_open/tool.visible = true
func _on_Dekupiersaege_close_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			$Dekupiersaege_open/tool.visible = false
