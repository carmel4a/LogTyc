extends Node2D

var buy={
	"Units":{
		"Worker":preload("res://scenes/Units/Worker/Worker.tscn"),
	}
}
func _ready():
	set_process_input(true)
	set_process(true)


var click_margin = 20
var mo_po = Vector2(0,0)
var rmb_pos = Vector2(0,0)
var action
var blocade = 0
var is_drag

func _process(delta):
	is_drag = is_drag()

func is_drag():
	if action ==0:
		mo_po = get_global_mouse_pos()
		return (-1)
	if action ==1 and blocade==0:
		rmb_pos = get_global_mouse_pos()
		blocade = 1
		return (-1)
	if action ==2:
		var shift = sqrt(pow((rmb_pos.x-mo_po.x),2)+pow((rmb_pos.y-mo_po.y),2))
		if shift > click_margin:
			return (1)
		else:
			return (0)

		
func _input(event):
	if (event.type == InputEvent.MOUSE_BUTTON) or (event.type == InputEvent.MOUSE_MOTION) :
		if event.is_action_pressed("con_menu") and blocade!=1:
			action = 1
		elif event.is_action_released("con_menu") and blocade!=0:
			action = 2
			blocade = 0
		else:
			action = 0