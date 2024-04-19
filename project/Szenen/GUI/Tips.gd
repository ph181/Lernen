extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var texts = [ "In der Küche sehe ich, was ich schon alles kann.","Im Kinderzimmer kann ich mein Wissen testen.","Auf dem Dachboden kann ich Versuche durchführen.","Ein Kapitel ist abgeschlossen sobald alle Aufgaben und Versuche gelöst sind.","Weitere Tipps gibt es beim Klicken auf das Fragezeichen."]
var curText = -1
var curTip = -1
var tipps = ["Du musst alle Aufgaben und Versuche durchführen, um ins nächste Kapitel zu kommen.", "Auch wenn du eine Aufgabe oder einen Versuch schon abgeschlossen hast, kannst du deine Ergebnisse nochmals anschauen oder eigene Versuche durchführen.","Im Buch findest du nützliches Wissen zu den Aufgaben im Kinderzimmer.","Die Bedienungshilfe erhältst du, wenn du die ESC Taste drückt oder das Zahnrad oben rechts klickst.","In der Küche kannst du sehen, welche Themen du bereits gemeistert hast","Kehre über die ESC Taste oder das Zahnrad oben rechts ins Hauptmenü zurück, um das Spiel zu beenden."]
var chapterTexts = ["Super! Jetzt habe ich schonmal eine bisschen Licht. Vielleicht kann ich mehrere Lampen kombinieren, damit es heller wird?", "Super! Das ist zwar deutlich heller, aber um das ganze Haus zu beleuchten bräuchte ich mehr Batterien als ich habe. Vielleicht können wir die Lampen auch noch anders kombinieren?", "Jetzt ist es zwar heller, aber die Batterien werden nicht lange halten. Vielleicht kann man die Schaltungen, die wir bisher probiert haben, auch miteinander kombinieren?","Prima! Vielen Dank für deine Hilfe, ich hoffe es hat dir Spass gemacht!"]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Control_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			visible = false




func _on_show2_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			visible = true
			if curText >= texts.size():
				nextTip()


func _on_OK_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			SoundFx.buttonsound()
			$OK/arrow.visible = false
			nextText()
			
func nextText():
	curText +=1
	if curText >= texts.size():
		$OK.visible = false
		visible = false
		
	else:
		if curText == 1:
			get_parent().get_node("AnimationPlayer").play("ugToEg")
			get_parent().setRoomSate(get_parent().scene_rooms.KinderZimmer )
		elif curText == 2:
			get_parent().get_node("AnimationPlayer").play("egToDg")
			get_parent().setRoomSate(get_parent().scene_rooms.Dachboden )
		elif curText >= 4:
			Myglobals.tutorial_finished = true
			$Sprite2.visible = true
		$RichTextLabel.text = texts[curText]
		
	
func nextTip():
	curTip += 1
	$RichTextLabel.text = tipps[curTip % tipps.size()]
	$Sprite2.visible = true
	
func setChapterText(var c ):
	$RichTextLabel.text = chapterTexts[c-1]
	visible = true
		
func load_this():
	visible = false
	curText = texts.size()
