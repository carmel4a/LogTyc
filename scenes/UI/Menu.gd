
extends PopupMenu
# time to move a mouse
var timer_delay = 0.2

# --------------------------
# Is menu showed?
var showed = 0
# Vector of mouse's motion.
var blokade = 0
func _ready():
	set_process(true)
	set_process_input(true)
func _process(delta):
	get_node("../Label").set_text(str(OS.get_frames_per_second()))

	if System.is_drag==0 and showed == 0 and blokade == 0:
		var mouse = Vector2()
		mouse = get_node("../../mouse_pos").get_global_mouse_pos()
#		get_parent().tx = floor(mouse.x/128)
#		get_parent().ty = floor(mouse.y/128)
		if get_node("../Botton_menu").type_of_action == 0:
			clear()
			set_size(Vector2(0,0))
			get_node("orders").clear()
			add_item(tr("BUY"))
			add_item(tr("SELL"))
	#		add_submenu_item("orers","orders")
	#		get_node("orders").add_item("up",0,0)
			show_modal()
			set_pos(Vector2(get_viewport().get_mouse_pos().x-get_size().x,get_viewport().get_mouse_pos().y))
			showed = 1
		if get_node("../Botton_menu").type_of_action == 1:
			clear()
			set_size(Vector2(0,0))
			get_node("orders").clear()
			add_item(tr("EDIT_ORDER"))
			show_modal()
			set_pos(Vector2(get_viewport().get_mouse_pos().x-get_size().x,get_viewport().get_mouse_pos().y))
			showed = 1
	if is_hidden() == true:
		showed = 0


func _on_PopupMenu_item_pressed( ID ):
	if get_node("../Botton_menu").type_of_action == 0:
		if ID == 0:
			get_node("../Option_menu").show()
		if ID == 1:
			get_node("../../Level/Layers").delete("Units")
	if get_node("../Botton_menu").type_of_action == 1:
		if ID == 0:
#			get_node("../../Level/Layers/Units").get_sth()
			pass
			
func _input(event):
	if event.is_action_pressed("con_menu"):
		