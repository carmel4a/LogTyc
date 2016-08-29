#####################################
#                                   #
#      Extended Camera 2D node      #
#                                   #
#####################################
extends Camera2D

# Main variables, consts, etc.

# key - by keyboard
# Camera control settings: 
# drag - by right mouse button;
# edge - by moving mouse to the window edge
# wheel zoom in/out by mouse wheel
var key = true
var drag = true
var edge = false
var wheel = true
# Initial zoom value taken from Editor.
var camera_zoom = get_zoom()
# Value meaning how near to the window frame (in px) the mouse must be, to shift a view.
const camera_margin = 50
# Camera speed in px/s. It is changing in the code by zoom, to keep const. speed value.
var camera_speed = 450 
# It changes a camera zoom value in ?units, but it works... (x, y) (ps. prob. in view multiples ).
const camera_zoom_speed = Vector2(1, 1)
# Vector of actual position of camera.
var camera_movement = Vector2()
# Previouse mouse position used to count delta of the mouse movement.
var prev_mouse_pos = null

# After creation (...)
func _ready():
# Process _process every rendder frame and _imput function every recive an event.
	set_process(true)
	set_process_input(true)

func _process(delta):
	
	
	
# Set camera movement to zero, and update camera speed. (sry!)
	camera_speed = 450 * 2*sqrt(camera_zoom.x)
	camera_movement = Vector2()
# Control by keyboard handled by @ImputMap.
	if key == true:
		if Input.is_action_pressed("ui_up"):
			camera_movement.y -= camera_speed*delta
		if Input.is_action_pressed("ui_down"):
			camera_movement.y += camera_speed*delta
		if Input.is_action_pressed("ui_left"):
			camera_movement.x -= camera_speed*delta
		if Input.is_action_pressed("ui_right"):
			camera_movement.x += camera_speed*delta
# Control by mouse when it is in the margin (defined by camera_margin).
	if edge == true:
		if get_viewport().get_rect().size.x-get_viewport().get_mouse_pos().x<camera_margin:
			camera_movement.x += camera_speed*delta
		if get_viewport().get_mouse_pos().x<camera_margin:
			camera_movement.x -= camera_speed*delta
		if get_viewport().get_rect().size.y-get_viewport().get_mouse_pos().y<camera_margin:
			camera_movement.y += camera_speed*delta
		if get_viewport().get_mouse_pos().y<camera_margin:
			camera_movement.y -= camera_speed*delta
# Control by right mouse button; draging. Have no idea how it is working.
	if drag == true:
		if Input.is_mouse_button_pressed(BUTTON_RIGHT):
			camera_movement = prev_mouse_pos - get_viewport().get_mouse_pos()
# Update position of the camera, and mouse.
	set_pos(get_pos()+camera_movement)
	prev_mouse_pos = get_viewport().get_mouse_pos()


# When recive an event (...)
func _input(event):
# [!] Checking if user used mouse wheel. _!_ not handled by @ImputMap.
	if event.type==InputEvent.MOUSE_BUTTON and wheel == true:
# Checing if potential zoom won't zoom 0; in that cause Engine'll flip screen.
		if (event.button_index==BUTTON_WHEEL_UP) and (camera_zoom.x-camera_zoom_speed.x>0 or camera_zoom.y-camera_zoom_speed.y>0):
			camera_zoom -= camera_zoom_speed
			set_zoom(camera_zoom)
# [!] there should be any limit to zoom out!
		if event.button_index==BUTTON_WHEEL_DOWN:
			camera_zoom += camera_zoom_speed
			set_zoom(camera_zoom)