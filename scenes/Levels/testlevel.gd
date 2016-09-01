
extends Node
var order_i = load("res://scenes/Order/Order.tscn")

func _ready():
#	create_ortder_s()
	pass
#	create_ortder("abc")
#	get_node("abc").set_pos(Vector2(128,0))
	
func create_ortder(name):

	var i = order_i.instance()
	i.set_name(name)
	add_child(i,true)
	
func create_ortder_s():

	var od = order_i.instance()
	add_child(od,true)
	
func add_order(x,y,m):
	if get_node("orders").orders.has(str(x)+" "+str(y)) == false:
		var order = order_i.instance()
		get_node("orders").add_child(order,true)
		get_node("orders").get_child(get_node("orders").get_child_count()-1).set_pos(Vector2(x*128+64,y*128+64))
		var d
		if m == 0:
			d = 0
		if m == 1:
			d = 270
		if m == 2:
			d = 180
		if m == 3:
			d = 90
		get_node("orders").get_child(get_node("orders").get_child_count()-1).set_rotd(d)
		get_node("orders").orders = {str(x)+" "+str(y):str(d)}