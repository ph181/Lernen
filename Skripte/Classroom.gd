extends Control

var classroom = Classroom.new()

func _ready():
	# Find the teacher and locker nodes in the scene
	for node in get_children():
		if node.has_method("is_teacher"):
			classroom.add_teacher(node)
		elif node.has_method("is_locker"):
			classroom.add_locker(node)

func _process(delta):
	if Input.is_action_just_pressed("ui_toggle_view"):
		classroom.toggle_view()

func _draw():
	# Draw the teacher or lockers based on the current view
	if classroom.current_view == "teacher":
		classroom.teacher.draw()
	else:
		for locker in classroom.lockers:
			locker.draw()
