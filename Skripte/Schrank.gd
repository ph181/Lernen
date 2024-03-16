extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


func _on_CloseRaum_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			get_tree().change_scene("res://Szenen/Klassenzimmer.tscn") # 

func _on_CloseRaum_mouse_entered():
	get_parent().get_node("CloseRaum").rect_scale *= 1.2
	
func _on_CloseRaum_mouse_exited():
	get_parent().get_node("CloseRaum").rect_scale /= 1.2



func _on_Werkzeug_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			$Werkzeug.visible = true

func _on_Werkzeug_mouse_entered():
	Input.set_default_cursor_shape(2)

func _on_Werkzeug_mouse_exited():
	Input.set_default_cursor_shape(0)



func _on_Zangen_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			$alleZangen.visible = true
			$alleZangen/Z_Allgemein.visible = true
func _on_Zangen_mouse_entered():
	$Zangen.scale *= 1.2
func _on_Zangen_mouse_exited():
	$Zangen.scale /= 1.2


func _on_Seiten_mouse_entered():
	get_node("alleZangen/Seiten/ColorRect").visible = true
	get_node("alleZangen/Seiten/TextureRect").rect_scale *= 1.2
	
func _on_Seiten_mouse_exited():
	get_node("alleZangen/Seiten/ColorRect").visible = false
	get_node("alleZangen/Seiten/TextureRect").rect_scale /= 1.2
	
func _on_Rund_mouse_entered():
	get_node("alleZangen/Rund/ColorRect").visible = true
	get_node("alleZangen/Rund/TextureRect").rect_scale *= 1.2
	
func _on_Rund_mouse_exited():
	get_node("alleZangen/Rund/ColorRect").visible = false
	get_node("alleZangen/Rund/TextureRect").rect_scale /= 1.2
	
func _on_Kombi_mouse_entered():
	get_node("alleZangen/Kombi/ColorRect").visible = true
	get_node("alleZangen/Kombi/TextureRect").rect_scale *= 1.2
	
func _on_Kombi_mouse_exited():
	get_node("alleZangen/Kombi/ColorRect").visible = false
	get_node("alleZangen/Kombi/TextureRect").rect_scale /= 1.2
	
func _on_Rohr_mouse_entered():
	get_node("alleZangen/Rohr/ColorRect").visible = true
	get_node("alleZangen/Rohr/TextureRect").rect_scale *= 1.2
	
func _on_Rohr_mouse_exited():
	get_node("alleZangen/Rohr/ColorRect").visible = false
	get_node("alleZangen/Rohr/TextureRect").rect_scale /= 1.2



func _on_Saegen_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			$alleSaegen.visible = true
			
func _on_SaegenClose_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			$alleSaegen.visible = false
			
func _on_Saegen_mouse_entered():
	$Saegen.scale *= 1.2
	
func _on_Saegen_mouse_exited():
	$Saegen.scale /= 1.2
	
func _on_SaegenClose_mouse_entered():
	$alleSaegen/SaegenClose.rect_scale *= 1.2
	
func _on_SaegenClose_mouse_exited():
	$alleSaegen/SaegenClose.rect_scale /= 1.2

func _on_Fein_mouse_entered():
	get_node("alleSaegen/Fein/ColorRect").visible = true
	get_node("alleSaegen/Fein/TextureRect").rect_scale *= 1.2
	
func _on_Fein_mouse_exited():
	get_node("alleSaegen/Fein/ColorRect").visible = false
	get_node("alleSaegen/Fein/TextureRect").rect_scale /= 1.2
	
func _on_Japan_mouse_entered():
	get_node("alleSaegen/Japan/ColorRect").visible = true
	get_node("alleSaegen/Japan/TextureRect").rect_scale *= 1.2
	
func _on_Japan_mouse_exited():
	get_node("alleSaegen/Japan/ColorRect").visible = false
	get_node("alleSaegen/Japan/TextureRect").rect_scale /= 1.2
	
func _on_Laub_mouse_entered():
	get_node("alleSaegen/Laub/ColorRect").visible = true
	get_node("alleSaegen/Laub/TextureRect").rect_scale *= 1.2
	
func _on_Laub_mouse_exited():
	get_node("alleSaegen/Laub/ColorRect").visible = false
	get_node("alleSaegen/Laub/TextureRect").rect_scale /= 1.2
	
func _on_Metall_mouse_entered():
	get_node("alleSaegen/Metall/ColorRect").visible = true
	get_node("alleSaegen/Metall/TextureRect").rect_scale *= 1.2
	
func _on_Metall_mouse_exited():
	get_node("alleSaegen/Metall/ColorRect").visible = false
	get_node("alleSaegen/Metall/TextureRect").rect_scale /= 1.2




func _on_Feilen_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			get_parent().get_node("FeilenRaspeln").visible = true

func _on_Feilen_mouse_entered():
	$Feilen.scale *= 1.2
	
func _on_Feilen_mouse_exited():
	$Feilen.scale /= 1.2


func _on_Feile_mouse_entered():
	get_node("FeileRaspel/Feile/ColorRect").visible = true
	get_node("FeileRaspel/Feile/TextureRect").rect_scale *= 1.2
	
func _on_Feile_mouse_exited():
	get_node("FeileRaspel/Feile/ColorRect").visible = false
	get_node("FeileRaspel/Feile/TextureRect").rect_scale /= 1.2
	
func _on_Raspel_mouse_entered():
	get_node("FeileRaspel/Raspel/ColorRect").visible = true
	get_node("FeileRaspel/Raspel/TextureRect").rect_scale *= 1.2
	
func _on_Raspel_mouse_exited():
	get_node("FeileRaspel/Raspel/ColorRect").visible = false
	get_node("FeileRaspel/Raspel/TextureRect").rect_scale /= 1.2



func _on_Verbinder_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			$alleVerbinder.visible = true
			
func _on_Verbinder_mouse_entered():
	$Verbinden.scale *= 1.2
	
func _on_Verbinder_mouse_exited():
	$Verbinden.scale /= 1.2
	
	

func _on_Schraubendreher_mouse_entered():
	get_node("alleVerbinder/Schraubendreher/ColorRect").visible = true
	get_node("alleVerbinder/Schraubendreher/TextureRect").rect_scale *= 1.2

func _on_Schraubendreher_mouse_exited():
	get_node("alleVerbinder/Schraubendreher/ColorRect").visible = false
	get_node("alleVerbinder/Schraubendreher/TextureRect").rect_scale /= 1.2

func _on_Holzleim_mouse_entered():
	get_node("alleVerbinder/Holzleim/ColorRect").visible = true
	get_node("alleVerbinder/Holzleim/TextureRect").rect_scale *= 1.2

func _on_Holzleim_mouse_exited():
	get_node("alleVerbinder/Holzleim/ColorRect").visible = false
	get_node("alleVerbinder/Holzleim/TextureRect").rect_scale /= 1.2

func _on_Heisskleber_mouse_entered():
	get_node("alleVerbinder/Heisskleber/ColorRect").visible = true
	get_node("alleVerbinder/Heisskleber/TextureRect").rect_scale *= 1.2

func _on_Heisskleber_mouse_exited():
	get_node("alleVerbinder/Heisskleber/ColorRect").visible = false
	get_node("alleVerbinder/Heisskleber/TextureRect").rect_scale /= 1.2

func _on_SchraubLeimzwinge_mouse_entered():
	get_node("alleVerbinder/SchraubLeimzwinge/ColorRect").visible = true
	get_node("alleVerbinder/SchraubLeimzwinge/TextureRect").rect_scale *=1.2

func _on_SchraubLeimzwinge_mouse_exited():
	get_node("alleVerbinder/SchraubLeimzwinge/ColorRect").visible = false
	get_node("alleVerbinder/SchraubLeimzwinge/TextureRect").rect_scale /= 1.2




func _on_Maschinen_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			$Maschinen.visible = true
			



func _on_Maschinen_mouse_entered():
	$Maschinen.scale *= 1.2


func _on_Maschinen_mouse_exited():
	$Maschinen.scale /= 1.2


func _on_MaschinenClose2_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			$alleMaschinen.visible = false


func _on_MaschinenClose2_mouse_entered():
	$alleMaschinen/MaschinenClose2.rect_scale *= 1.2


func _on_MaschinenClose2_mouse_exited():
	$alleMaschinen/MaschinenClose2.rect_scale /= 1.2


func _on_Stichs_mouse_entered():
	get_node("alleMaschinen/Stichs/ColorRect").visible = true
	get_node("alleMaschinen/Stichs/TextureRect").rect_scale *= 1.2

func _on_Stichs_mouse_exited():
	get_node("alleMaschinen/Stichs/ColorRect").visible = false
	get_node("alleMaschinen/Stichs/TextureRect").rect_scale /= 1.2

func _on_Akkuschrau_mouse_entered():
	get_node("alleMaschinen/Akkuschrau/ColorRect").visible = true
	get_node("alleMaschinen/Akkuschrau/TextureRect").rect_scale *= 1.2


func _on_Akkuschrau_mouse_exited():
	get_node("alleMaschinen/Akkuschrau/ColorRect").visible = false
	get_node("alleMaschinen/Akkuschrau/TextureRect").rect_scale /= 1.2


func _on_Dekupiers_mouse_entered():
	get_node("alleMaschinen/Dekupiers/ColorRect").visible = true
	get_node("alleMaschinen/Dekupiers/TextureRect").rect_scale *= 1.2


func _on_Dekupiers_mouse_exited():
	get_node("alleMaschinen/Dekupiers/ColorRect").visible = false
	get_node("alleMaschinen/Dekupiers/TextureRect").rect_scale /= 1.2


func _on_Standbohr_mouse_entered():
	get_node("alleMaschinen/Standbohr/ColorRect").visible = true
	get_node("alleMaschinen/Standbohr/TextureRect").rect_scale *= 1.2


func _on_Standbohr_mouse_exited():
	get_node("alleMaschinen/Standbohr/ColorRect").visible = false
	get_node("alleMaschinen/Standbohr/TextureRect").rect_scale /= 1.2





