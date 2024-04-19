extends Node2D


var  badge1Stromkreis : Texture = preload("res://Grafik/Assets/Haus/badges/Stromkreis.png")
var  badge2Kurzschluss : Texture = preload("res://Grafik/Assets/Haus/badges/Kurzschluss.png")
var  badge3Stromstaerke : Texture = preload("res://Grafik/Assets/Haus/badges/Stromstaerke.png")
var  badge4ReihenS : Texture = preload("res://Grafik/Assets/Haus/badges/Reihenschaltung.png")
var  badge5Spannung : Texture = preload("res://Grafik/Assets/Haus/badges/Spannung.png")
var  badge6ParrallelS : Texture = preload("res://Grafik/Assets/Haus/badges/Parallelschaltung.png")
var  badge7Kombinieren : Texture = preload("res://Grafik/Assets/Haus/badges/kombinieren.png")
var  badge8Knotenregel : Texture = preload("res://Grafik/Assets/Haus/badges/Knotenregel.png")
var  badge9Maschenregel : Texture = preload("res://Grafik/Assets/Haus/badges/Maschenregel.png")
# k1l1   		k1a2 3 8
var l1b1 = [1]
var a1b1 = [2,3,8]
# k1l2   		k1a4 9
var l1b2 = [2]
var a1b2 = [4,9]


# k2l2 3 		k2a1 3 4
var l1b3 = [2,3]
var a1b3 = [1,3,4]
# k2l1 			k2a7
var l1b4 = [1]
var a1b4 = [6]


# k3l2 			k3a1 2
var l1b5 = [2]
var a1b5 = [1,2]
# k3l1 3		k3a7
var l1b6 = [1,3]
var a1b6 = [7]
# k3l4 			k3a4
var l1b7 = [2]
var a1b7 = [4]


# k4l3			k4a5 8
var l1b8 = [3]
var a1b8 = [4,7]
# k4l2			k4a6 7
var l1b9 = [2]
var a1b9 = [5,6]

var aufgBK1
var aufgBK2
var aufgBK3
var aufgBK4
var lvlBK1
var lvlBK2
var lvlBK3
var lvlBK4

var baseclass = preload("res://Szenen/EG/Badges.tscn")
var badgesArr  = []
var badgesCompl = []

var completedQueue = []


	
func own_init():
	for _i in range(9):
		badgesCompl.append(false)
	
	
	aufgBK1= [a1b1,a1b2]
	aufgBK2= [a1b3,a1b4]
	aufgBK3= [a1b5,a1b6,a1b7]
	aufgBK4= [a1b8,a1b9] 
	
	lvlBK1= [l1b1,l1b2]
	lvlBK2= [l1b3,l1b4]
	lvlBK3= [l1b5,l1b6,l1b7]
	lvlBK4= [l1b8,l1b9] 
	
	for _i in range (9):
		var b : Badge = baseclass.instance()
		badgesArr.append(b)
		b.visible = true
		
		
	badgesArr[0].setTex(badge1Stromkreis, "Der einfache Stromkreis")
	badgesArr[1].setTex(badge2Kurzschluss, "Der Kurzschluss")
	badgesArr[2].setTex(badge3Stromstaerke, "Das Ampermeter")
	badgesArr[3].setTex(badge4ReihenS,"Die Reihenschaltung")
	badgesArr[4].setTex(badge5Spannung,"Das Voltmeter")
	badgesArr[5].setTex(badge6ParrallelS,"Die Parallelschaltung")
	badgesArr[6].setTex(badge7Kombinieren, "Batterie Kombinator")
	badgesArr[7].setTex(badge8Knotenregel, "Die Knotenregel")
	badgesArr[8].setTex(badge9Maschenregel, "Die Maschenregel")
	checkBadge()

func checkBadge():
	# bsp. GlobalScenes.AufgabenView1.previewslvl
	var previewsA
	var previewsK
	
	var _aufg
	var _lvl
	
	for i in range(4):
		if (i == 0):
			previewsA = GlobalScenes.AufgabenView1.previewslvl
			previewsK = GlobalScenes.LvlView1.levelPreviews
			
			if checkAufgaben(aufgBK1[0],previewsA) && checkLevels(lvlBK1[0],previewsK):
				addBadge(0)
			if checkAufgaben(aufgBK1[1],previewsA)&&checkLevels(lvlBK1[1],previewsK):
				addBadge(1)
			
			
			
		if (i == 1):
			previewsA = GlobalScenes.AufgabenView2.previewslvl
			previewsK = GlobalScenes.LvlView2.levelPreviews
			
			if checkAufgaben(aufgBK2[0],previewsA) && checkLevels(lvlBK2[0],previewsK):
				addBadge(2)
			if checkAufgaben(aufgBK2[1],previewsA)&&checkLevels(lvlBK2[1],previewsK):
				addBadge(3)
			
			
		if (i == 2):
			previewsA = GlobalScenes.AufgabenView3.previewslvl
			previewsK = GlobalScenes.LvlView3.levelPreviews
			if checkAufgaben(aufgBK3[0],previewsA)&&checkLevels(lvlBK3[0],previewsK):
				addBadge(4)
			if checkAufgaben(aufgBK3[1],previewsA)&&checkLevels(lvlBK3[1],previewsK):
				addBadge(5)
			if checkAufgaben(aufgBK3[2],previewsA)&&checkLevels(lvlBK3[2],previewsK):
				addBadge(6)
			
			
		if (i == 3):
			previewsA = GlobalScenes.AufgabenView4.previewslvl
			previewsK = GlobalScenes.LvlView4.levelPreviews
			if checkAufgaben(aufgBK4[0],previewsA)&&checkLevels(lvlBK4[0],previewsK):
				addBadge(7)
			if checkAufgaben(aufgBK4[1],previewsA)&&checkLevels(lvlBK4[1],previewsK):
				addBadge(8)
		
			

func checkAufgaben(aufg,prevA):
	var done = true
	for a in aufg:
		if !prevA[a-1].completed:
			done = false
	return done
	

func checkLevels(lvl,prevL):
	var done = true
	for l in lvl:
		if !prevL[l-1].completed:
			done = false
	return done

func addBadge(nr):
	if (!badgesCompl[nr]):
		$ScrollContainer/HBoxContainer.add_child(badgesArr[nr])
		badgesCompl[nr] = true
		completedQueue.append(nr)
		

func checkQueue():
	
	if(get_parent().get_node("KapitelInfo/Arrows/VoltmeterUnlocked/AnimationPlayer").is_playing()):
		return
	if(get_parent().get_node("KapitelInfo/Arrows/AmpereGift/AnimationPlayer").is_playing()):
		return
	if(get_parent().get_node("KapitelInfo/Arrows/geschafft/KapitelGschafft").is_playing()):
		return
#	if(get_parent().get_node("KapitelInfo/Arrows/geschafft/KapitelGschafft").is_playing()):
#		return
		
		
	var rewAni = get_parent().get_node("BReward")
	if completedQueue.size() >0:
			var q = completedQueue[0]
			if q == 0:
				rewAni.get_node("Sprite/Sprite").texture = badge1Stromkreis
			if q == 1:
				rewAni.get_node("Sprite/Sprite").texture = badge2Kurzschluss
			if q == 2:
				rewAni.get_node("Sprite/Sprite").texture = badge3Stromstaerke
			if q == 3:
				rewAni.get_node("Sprite/Sprite").texture = badge4ReihenS
			if q == 4:
				rewAni.get_node("Sprite/Sprite").texture = badge5Spannung
			if q == 5:
				rewAni.get_node("Sprite/Sprite").texture = badge6ParrallelS
			if q == 6:
				rewAni.get_node("Sprite/Sprite").texture = badge7Kombinieren
			if q == 7:
				rewAni.get_node("Sprite/Sprite").texture = badge8Knotenregel
			if q == 8:
				rewAni.get_node("Sprite/Sprite").texture = badge9Maschenregel
			rewAni.get_node("AnimationPlayer").play("newGift")
			completedQueue.remove(0)


func _on_BadgesView_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			self.visible = true


func _on_AnimationPlayer_animation_finished(_anim_name):
	 checkQueue()

func save_this():
	var dict = {}
	for i in range(9):
		dict[i] = badgesCompl[i]
		
	return dict
	
func load_this(dict):
	for i in range(9):
		if  dict[i]:
			addBadge(i)
		completedQueue = []
		
	
