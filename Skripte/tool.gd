extends CharacterBody2D

signal clicked

var held = false


func _ready():
	pass
	
func _physics_process(delta):
	if held:
		global_transform.origin = get_global_mouse_position()
		


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			print("clicked")
			clicked.emit(self)
			



		
func pickup():
	if held:
		return
	held = true

func drop(impulse=Vector2.ZERO):
	if held:
		apply_central_impulse(impulse)
		held = false
