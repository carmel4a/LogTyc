##########################################################
#                                                        #
# This is node wich controls main functions of UI, i.e.  #
# stores globals. Every part of UI should be autonomous. #
# Members shoul be necessary.                            #
#                                                        #
##########################################################


extends CanvasLayer

# Type of action wich user may do, when use right mouse button. 
var type_of_action = 0
var editing = 0
var t = 0
var tx = 0
var ty = 0
var mouse = Vector2(0,0)

func _ready():
	set_process(true)
	set_process_input(true)
func _process(delta):
	if editing == 1 and Input.is_mouse_button_pressed(BUTTON_LEFT):
		mouse = get_node("../mouse_pos").get_global_mouse_pos()
		if mouse.x == 0:
			mouse.x = -1
		if mouse.y == 0:
			mouse.y = -1
		tx = floor(mouse.x/128)
		ty = floor(mouse.y/128)
		
		if t == 1:
			get_node("../level/TileMap").set_cell(tx,ty,0,false,false,false)
		if t == 2:
			get_node("../level/TileMap").set_cell(tx,ty,1,false,false,false)
	if Input.is_action_pressed(	"ui_cancel"):
		editing = 0
		t = 0
	get_node("Label").set_text(str(tx)+" "+str(ty))

# Managing signals
# Singals fron botton buttons
func _on_Bulid_btt_pressed():
	type_of_action = 0
func _on_Orders_btt_pressed():
	type_of_action = 1
	TranslationServer.set_locale("en")
func _on_Stats_btt_pressed():
	type_of_action = 2
	TranslationServer.set_locale("pl")

func _on_PopupMenu_item_pressed( ID ):
	if ID == 0:
		get_node("OptionMenu").show()
	

func _on_Button7_pressed():
	editing = 1
	t = 1

func _on_Button8_pressed():
	editing = 1
	t = 2