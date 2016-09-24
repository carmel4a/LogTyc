
extends Node
# frame texture
var frame_t = preload("res://res/UI/adding_frames.png")

# a sprite with item witch is adding
var shadow

# frames: bigger and smaller one


var objects = {}

func _ready():
#	add_child(frame)
#	add_child(frame1)
#	frame.set_texture(frame_t)
#	frame1.set_texture(frame_t)
#	frame.set_region(true)
#	frame1.set_region(true)
#	frame.set_name("frame")
#	frame1.set_name("frame1")
#	frame.hide()
#	frame1.hide()
	pass
	
# 0 - idle
# 1 - adding
# 2 - deleting
var action = 0
var what_add = null
var i = 1
func _process(delta):
	if action == 1:
		adding_item(null)
	if action == 2:
		sell()
	if action == 3:
		get_sth()
	if action == 0:
		if i <= 0:
			get_node("../../../UI/PopupMenu").blokade = 0
			i = 1
			set_process(false)
		else: 
			i -= 1*delta*1.7

# WTF? That func wanna kill me, but works so I'll leave it
func adding_item(name_of_item):
	get_node("../../../UI/PopupMenu").blokade = 1
	var x = floor(get_node("../../../mouse_pos").get_global_mouse_pos().x/64)*64+32
	var y = floor(get_node("../../../mouse_pos").get_global_mouse_pos().y/64)*64+32
	
	if action == 0:
		action = 1
		shadow = System.types[get_name()][name_of_item].instance()
		shadow.set_name("shadow")
		add_child(shadow)
		if name_of_item != null:
			what_add = name_of_item
		frame.set_region_rect(Rect2(Vector2(128,0),Vector2(128,128)))
		frame1.set_region_rect(Rect2(Vector2(0,0),Vector2(128,128)))
		get_node("frame").show()
		get_node("frame1").show()
		set_process(true)
		
	if action == 1:
		get_node("frame").set_global_pos(Vector2(floor(get_node("../../../mouse_pos").get_global_mouse_pos().x/128)*128+64,floor(get_node("../../../mouse_pos").get_global_mouse_pos().y/128)*128+64))
		get_node("frame1").set_global_pos(Vector2(floor(get_node("../../../mouse_pos").get_global_mouse_pos().x/64)*64+64,floor(get_node("../../../mouse_pos").get_global_mouse_pos().y/64)*64+64))
		get_node("shadow").set_pos(get_node("../../../mouse_pos").get_global_mouse_pos())
	
	if (((System.is_drag == 0) and (action == 1)) or (get_node("../../../UI/Option_menu").is_hidden() == true)):
		remove_child(get_node("shadow"))
		get_node("frame").hide()
		get_node("frame1").hide()
		action = 0
		
		
		
		
	if ((what_add!=null)and(action == 1) and (Input.is_mouse_button_pressed(BUTTON_LEFT)) and not(objects.values().has(str(x)+" "+str(y)))):
		var v = System.types["Units"][what_add].instance()
		v.set_meta("type",what_add)
		v.set_name(what_add+first_free_number(what_add))
		v.set_pos(Vector2(x,y))
		add_child(v)
		objects[what_add+first_free_number(what_add)] = (str(x)+" "+str(y))
		print("A LIST OF LAYER CHILD:")
		for ch in get_children():
			print(ch.get_name())
		print("________________")
# It gets a name of item and cheching first free number in 'objects', i.e.:
# We have: v, v1, v2, v3, v5, v6
# it will return '4' ... in theory
func first_free_number(object_type):
	var ii = 0
	for i in get_children():
			if i.get_meta("type") == object_type:
				ii += 1
	if ii == 0:
		return ("")
	elif ii == 1:
		if not(objects.keys().has(object_type)):
			return ("")
		elif not(objects.keys().has(object_type+" 1")):
			return (str(" 1"))
	elif ii >= 2:
		for ran in range(1,ii+1):
			if not(objects.keys().has(object_type+" "+str(ran))):
				return (str(" "+str(ran)))
	else:
		return("CRITIC ERR")
	
	
func sell():
	var x = floor(get_node("../../../mouse_pos").get_global_mouse_pos().x/64)*64+32
	var y = floor(get_node("../../../mouse_pos").get_global_mouse_pos().y/64)*64+32
	get_node("../../../UI/PopupMenu").blokade =1
	
	if action == 0:
		action = 2
		frame.set_region_rect(Rect2(Vector2(128,128),Vector2(128,128)))
		frame1.set_region_rect(Rect2(Vector2(0,128),Vector2(128,128)))
		get_node("frame").show()
		get_node("frame1").show()
		set_process(true)
		
	if action == 2:
		get_node("frame").set_global_pos(Vector2(floor(get_node("../../../mouse_pos").get_global_mouse_pos().x/128)*128+64,floor(get_node("../../../mouse_pos").get_global_mouse_pos().y/128)*128+64))
		get_node("frame1").set_global_pos(Vector2(floor(get_node("../../../mouse_pos").get_global_mouse_pos().x/64)*64+64,floor(get_node("../../../mouse_pos").get_global_mouse_pos().y/64)*64+64))
	if (System.is_drag == 0) and (action == 2):
		get_node("frame").hide()
		get_node("frame1").hide()
		action = 0
	if ((action == 2) and (Input.is_mouse_button_pressed(BUTTON_LEFT)) and (objects.values().has(str(x)+" "+str(y)))):
		for j in objects.keys():
			if objects[j]==str(str(x)+" "+str(y)):
				
				objects.erase(j)
				for k in get_children():
					if k.get_name() == j:
						
						remove_child(k)

func get_sth():
	if action == 0:
		action = 3
		frame1.set_region_rect(Rect2(Vector2(0,0),Vector2(128,128)))
		set_process(true)
		
	if action == 3:
		for i in objects.values():
			if i == str(str(floor(get_node("../../../mouse_pos").get_global_mouse_pos().x/64)*64+32)+" "+str(floor(get_node("../../../mouse_pos").get_global_mouse_pos().y/64)*64+32)):
				get_node("frame1").set_global_pos(Vector2(floor(get_node("../../../mouse_pos").get_global_mouse_pos().x/64)*64+64,floor(get_node("../../../mouse_pos").get_global_mouse_pos().y/64)*64+64))
				get_node("frame1").show()
				for j in objects.keys():
					if objects[j]==i:
#						get_node("../../../UI/Option_menu").order_list(str(j))
#						print(j) // thats ho get a NAME of item in 1/4 place
						break
				break
			else:
				get_node("frame1").hide()

	if ((System.is_drag == 0) and (action == 3)):
		get_node("frame1").hide()
		action = 0
		set_process(false)