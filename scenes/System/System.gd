extends Node

var buy={
	"Units":{
		"Worker":preload("res://res/Units/Human/Worker.tscn"),
	}
}
func _ready():
	set_process_input(true)


# If button was preesed?
# idle 0
# pressed 1
# drag 2
# relased 3
var click_margin = 20
var shift = Vector2(0,0)
var pressd = 0

func is_drag():
	if pressd == 1:
		shift = Vector2(0,0)
		shift = get_viewport().get_mouse_pos()
		pressd =2
	if pressd == 3:
		if abs(shift.length()-get_viewport().get_mouse_pos().length()) <= click_margin:
			# do something if it is NOT a drag
			return(false)
		else:
			return(true)
	pressd = 0

		
func _input(event):
	if event.is_action_pressed("con_menu"):
		pressd = 1
	elif event.is_action_released("con_menu"):
		pressd = 3