
extends PopupMenu
# time to move a mouse
var timer_delay = 0.2
# magrin in px between ckick and drag
var click_margin = 20
# --------------------------
# Is menu showed?
var showed = 0
# Vector of mouse's motion.
var shift = Vector2(0,0)
# If button was preesed?
# idle 0
# pressed 1
# drag 2
# relased 3
var pressd = 0

func _ready():
	set_process(true)
	set_process_input(true)

func _process(delta):

	if get_node("../Botton_menu").type_of_action == 0 and showed ==0 and pressd==1:
		# reset shift
		shift = Vector2(0,0)
		shift = get_viewport().get_mouse_pos()
		pressd =2
	
	if get_node("../Botton_menu").type_of_action == 0 and pressd==3:

		if abs(shift.length()-get_viewport().get_mouse_pos().length()) <= click_margin:
			var mouse = Vector2()
			mouse = get_node("../../mouse_pos").get_global_mouse_pos()
#			get_parent().tx = floor(mouse.x/128)
#			get_parent().ty = floor(mouse.y/128)
#			
			clear()
			get_node("orders").clear()
			add_item(tr("BUY"))
			add_item(tr("SELL"))
#			add_submenu_item("orers","orders")
#			get_node("orders").add_item("up",0,0)
			show_modal()
			set_pos(Vector2(get_viewport().get_mouse_pos().x-get_size().x,get_viewport().get_mouse_pos().y))
			showed = 1
		pressd = 0

	if is_hidden() == true:
		showed = 0
		

func _input(event):
	if event.is_action_pressed("con_menu"):
		pressd = 1
	if event.is_action_released("con_menu"):
		pressd = 3

func _on_PopupMenu_item_pressed( ID ):
	if ID == 0:
		get_node("../Option_menu").show()
