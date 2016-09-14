
extends Node

var x
var y
var tex1
#//////
var shadow

func _ready():
	tex1  = load("res://res/Tileset/Tileset2/items.png")

#func _on_veh_choosed(name):
#	if name == "Veh1":
#		
#		
#		
#		var a = Sprite.new()
#		a.set_global_pos(get_node("../../../mouse_pos").get_global_mouse_pos())
#		a.set_texture(tex1)
#		a.set_z(3)
#		a.set_region_rect(Rect2(Vector2(0,128),Vector2(128,128)))
#		a.set_region(true)
#		a.show()
#		add_child(a)
var adding = 0
func adding_item(name_of_item):
	get_node("../../../User_interface/PopupMenu").set("blokade",1)
	if adding == 0:
		adding = 1
		shadow = System.buy[get_name()][name_of_item].instance()
		shadow.set_name("shadow")
		add_child(shadow)
		set_process(true)


func _process(delta):
	get_node("shadow").set_pos(get_node("../../../mouse_pos").get_global_mouse_pos())
	print(System.is_drag())
	if (System.is_drag==false and adding == 1):
		print("in if")
		remove_child(get_node("shadow"))
		adding = 0
		get_node("../../../User_interface/PopupMenu").blokade=0
		System.pressd=0
		set_process(false)
#	
		
		