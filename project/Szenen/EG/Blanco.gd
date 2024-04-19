extends Node2D

var currentPage = 1

var pages

func ownInit():
	pages = get_parent().get_node("pages")
	
func onSceneEnter():
	
	checkButtonValid()
	
	
func checkButtonValid():
		if currentPage <=1 :
			$Links.visible = false
		else:
			$Links.visible = true
			
		if currentPage >= get_parent().get_node("pages").get_child_count()-1:
			$Rechts.visible = false
		else:
			$Rechts.visible = true
	
func _on_AnimationPlayer_animation_finished(anim_name):
	visible = true
	
	if anim_name =="vor":
		pages.get_child(currentPage-1).fadeIn()
	if anim_name =="zurueck":
		if (currentPage < pages.get_child_count()):
			pages.get_child(currentPage).fadeIn()
	
	
func _on_rpfeil_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == 1:
				SoundFx.pagesound()
				goTo(currentPage+2)
				
func _on_lpfeil_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == 1:		
				SoundFx.pagesound()
				goTo(currentPage-2)

func goTo(nr):
	if (get_parent().is_playing()==true):
		if(get_parent().current_animation =="oeffnen"):
			get_parent().advance(get_parent().current_animation_length - get_parent().current_animation_position)
		else:
			return
	
	if (nr>currentPage):
		
		get_parent().play("vor")
		if (currentPage >=0):
			pages.get_child(currentPage).fadeOut()
		if (currentPage-1 >=0):
			pages.get_child(currentPage-1).fadeInv()
		
		if(nr < pages.get_child_count()): 
			pages.get_child(nr).fadeDirect()
			
		get_parent().get_parent().get_parent().geleseneSeiten +=2
	elif(nr<currentPage):
		get_parent().play("zurueck")
		if (currentPage-1 >=0):
			pages.get_child(currentPage-1).fadeOut()
		if (currentPage>=0):
			pages.get_child(currentPage).fadeInv()
		if(nr >= 1): 
			pages.get_child(nr-1).fadeDirect()
		
	currentPage =nr
	checkButtonValid()



		
