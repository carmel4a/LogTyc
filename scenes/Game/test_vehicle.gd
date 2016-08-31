
extends Sprite

var order = "r"
var is_loaded = false
var x
var y

func _ready():
	set_process(true)

func _process(delta):
	
	pass
	
func _tick():
	GetOrder()
	CheckLoad()
	Move()
func Move():
	if order == "r":
		set_global_pos(get_global_pos()+Vector2(128,0))
	if order == "l":
		set_global_pos(get_global_pos()-Vector2(128,0))
	if order == "u":
		set_global_pos(get_global_pos()+Vector2(0,128))
	if order == "b":
		set_global_pos(get_global_pos()-Vector2(0,128))
func CheckLoad():
	pass
	

func GetOrder():
	get_global_pos()
	if get_global_pos().x !=0:
		x = floor(get_global_pos().x/128)
	else:
		x = -1
	if get_global_pos().y !=0:
		y = floor(get_global_pos().y/128)
	else:
		y = -1
#	if get_node("../level/orders").get_cell(x,y) == 0:
#		if get_node("../level/orders").get_cell(x,y) != -1:
#			if get_node("../level/orders").get_cell(x,y).get_custom_transform().get_rotation() == 0:
#				order = "t"
#			if get_node("../level/orders").get_cell(x,y).get_custom_transform().get_rotation() == 90:
#				order = "r"
#			if get_node("../level/orders").get_cell(x,y).get_custom_transform().get_rotation() == 180:
#				order = "b"
#			if get_node("../level/orders").get_cell(x,y).get_custom_transform().get_rotation() == 270:
#				order = "l"