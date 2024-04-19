extends Node


class_name BaseEventClass

var btnIndx = null
var x = null
var y = null
var pressed = null

var keyVal = null
var myType = null



func _init(typ,btnI,x,y,kv,press ):
	self.x = x
	self.y = y
	myType = typ
	pressed = press
	keyVal = kv
	btnIndx = btnI
