
extends Node

var x
var y
var tex1
func _ready():
	tex1  = load("res://res/Tileset/Tileset2/items.png")

func _on_veh_choosed(name):
	if name == "Veh1":
		print("dziala")
		
		var a = Sprite.new()
		a.set_global_pos(get_node("../../../mouse_pos").get_global_mouse_pos())
		a.set_texture(tex1)
		a.set_z(3)
		a.set_region_rect(Rect2(Vector2(0,128),Vector2(128,128)))
		a.set_region(true)
		a.show()
		add_child(a)