extends Node2D



class_name BookRoom
var geleseneSeiten = 0
 

func _ready():
	pass

func ownInit():
	$lit/AnimationPlayer/Blanco.ownInit()
	GlobalScenes.BookScene = self
	fixModuate()
	
func fixModuate():
	for s in $lit/AnimationPlayer/pages.get_children():
		if s.get_position_in_parent() == 0 or s.get_position_in_parent() == 1:
			s.visible = true
		else:
			s.visible = false
		s.modulate.a = 1

func fixModuateOnLoad(nr):
	for s in $lit/AnimationPlayer/pages.get_children():
			if s.get_position_in_parent() == nr or s.get_position_in_parent() == nr-1:
				s.visible = true
			else:
				s.visible = false
			s.modulate.a = 1

func enterScene(_lastScene):
	if $lit/AnimationPlayer.is_playing():
		$lit/AnimationPlayer.stop(true)
	$lit/AnimationPlayer.play("oeffnen")
	$lit/AnimationPlayer/Blanco.onSceneEnter()
#	geleseneSeiten = $lit/AnimationPlayer/Blanco.currentPage+1
	


func _on_ButtonMainMenuBg_clicked(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			Myglobals.gotoScene(Myglobals.lastScene)
			$lit/AnimationPlayer.advance($lit/AnimationPlayer.current_animation_length -$lit/AnimationPlayer.current_animation_position)

func save_this():
	var dir  = { "geleseneSeiten":geleseneSeiten,
				"currentPage" : $lit/AnimationPlayer/Blanco.currentPage }
	
	return dir
	
func load_this(dir):
	ownInit()
	fixModuateOnLoad(int(dir["currentPage"]))
	geleseneSeiten = dir["geleseneSeiten"]
	$lit/AnimationPlayer/Blanco.goTo(int(dir["currentPage"]))

