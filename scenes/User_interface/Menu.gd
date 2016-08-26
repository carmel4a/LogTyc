
extends PopupMenu

var showed = 0

func _ready():
	set_process(true)

func _process(delta):
	if get_parent().type_of_action == 0 and Input.is_mouse_button_pressed(BUTTON_RIGHT) and showed !=1:
		clear()
		add_item("test", 0, 0)
		set_pos(get_viewport().get_mouse_pos())
		show()
		showed = 1

	if is_hidden()==true:
		showed = 0