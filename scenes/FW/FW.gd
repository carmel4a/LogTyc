
extends Node

# member variables here, example:
# var a=2
# var b="textvar"
var tx =0
var ty =0
var mouse = Vector2(0,0)
func _ready():
	pass
#func get_pos_on_map(path_to_mouse_pos_node,size_of_tile):
#	mouse = path_to_mouse_pos_node.get_global_mouse_pos()
#	if mouse.x == 0:
#		mouse.x = -1
#	if mouse.y == 0:
#		mouse.y = -1
#	tx = floor(mouse.x/size_of_tile)
#	ty = floor(mouse.y/size_of_tile)
#	print(str(mouse.x) + " " + str(mouse.y) +"  "+str(tx)+" "+str(ty))
#	return Vector2(tx,ty)