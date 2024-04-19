extends Control

var correct_password = "elehre_test!"

func _ready():
	$Button.connect("pressed", self, "_on_Button_pressed")
	$LineEdit.secret = true  # Setzt das LineEdit-Feld auf "Secret Character"-Modus

func _on_Button_pressed():
	var entered_password = $LineEdit.text
	if entered_password == correct_password:
		get_tree().change_scene("res://Szenen/GUI/Game.tscn")
	else:
		$Label.text = "Falsches Passwort, bitte versuchen Sie es erneut."
