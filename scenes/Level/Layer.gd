extends Node

var frame_t = preload("res://res/UI/adding_frames.png")
var layers = {}
var shadow
var action = 0
var blocade_delay = 1
onready var a_name
onready var a_layer
func _ready():
	for key in System.types.keys():
		layers[key]={}


func _process(delta):
	
	# 1/4 tile global mouse pos
	x = get_node("../../mouse_pos").get_global_mouse_pos().x
	y = get_node("../../mouse_pos").get_global_mouse_pos().y
	if str(action) == "add":

		add(null,null)
	if str(action) == "del":
		delete(null)
#	if action == 3:
#		get_sth()
	if str(action) == "0":
		if blocade_delay <= 0:
			get_node("../../UI/PopupMenu").blokade = 0
			blocade_delay = 1
			set_process(false)
		else: 
			blocade_delay -= delta * 1.7


func add(name, at_layer):
	if at_layer != null:
		a_layer = at_layer
	if name != null:
		a_name = name
	if str(action) == "0":
		action = "add"
		get_node("../../UI/PopupMenu").blokade = 1

		var frame = Sprite.new()
		var frame1 = Sprite.new()
		add_child(frame)
		add_child(frame1)
		frame.set_texture(frame_t)
		frame1.set_texture(frame_t)
		frame.set_region(true)
		frame1.set_region(true)
		frame.set_name("frame")
		frame1.set_name("frame1")
		frame.set_region_rect(Rect2(Vector2(128,0),Vector2(128,128)))
		frame1.set_region_rect(Rect2(Vector2(0,0),Vector2(128,128)))
		frame.show()
		frame1.show()
		if name != null:
			var shadow = System.types[at_layer][name].instance()
			shadow.set_name("shadow")
			add_child(shadow)
		set_process(true)
		
	if str(action) == "add":

		get_node("frame").set_global_pos(Vector2(floor(x/128)*128+64,floor(y/128)*128+64))
		get_node("frame1").set_global_pos(Vector2(floor(x/64)*64+64,floor(y/64)*64+64))
		get_node("shadow").set_pos(get_node("../../mouse_pos").get_global_mouse_pos())

		if ((System.is_drag == 0) or (get_node("../../UI/Option_menu").is_hidden() == true)):
			remove_child(get_node("shadow"))
			remove_child(get_node("frame"))
			remove_child(get_node("frame1"))
			action = 0
		
		if ((a_name != null) and (a_layer != null) and (Input.is_mouse_button_pressed(BUTTON_LEFT)) and (typeof(get_item(a_layer,floor(x/64)*64+32,floor(y/64)*64+32)) == TYPE_BOOL)):
			assert(a_name != null)
			assert(a_layer != null)
			set_item(a_layer,floor(x/64)*64+32,floor(y/64)*64+32,a_name)


func delete(at_layer):
	if at_layer != null:
		a_layer = at_layer
	get_node("../../UI/PopupMenu").blokade =1
	if str(action) == "0":
		action = "del"
		var frame = Sprite.new()
		var frame1 = Sprite.new()
		add_child(frame)
		add_child(frame1)
		frame.set_texture(frame_t)
		frame1.set_texture(frame_t)
		frame.set_region(true)
		frame1.set_region(true)
		frame.set_name("frame")
		frame1.set_name("frame1")
		frame.set_region_rect(Rect2(Vector2(128,128),Vector2(128,128)))
		frame1.set_region_rect(Rect2(Vector2(0,128),Vector2(128,128)))
		frame.show()
		frame1.show()
		set_process(true)
	if action == "del":
		get_node("frame").set_global_pos(Vector2(floor(x/128)*128+64,floor(y/128)*128+64))
		get_node("frame1").set_global_pos(Vector2(floor(x/64)*64+64,floor(y/64)*64+64))
		
		if System.is_drag == 0:
			remove_child(get_node("frame"))
			remove_child(get_node("frame1"))
			action = 0
		
		if ((Input.is_mouse_button_pressed(BUTTON_LEFT)) and (typeof(get_item(a_layer,floor(x/64)*64+32,floor(y/64)*64+32)) == TYPE_OBJECT )):
			remove_item(a_layer,get_item(a_layer, floor(x/64)*64+32, floor(y/64)*64+32).get_name())


# Return a NODE at layer at_layer in x, y coord.
func get_item(at_layer,x,y):
	for key in layers[at_layer].keys():
		if layers[at_layer][key] == (str(str(x) + " " + str(y))):
			return (get_node(key))
	return (false)


# Add item at_layer in GLOBAL x, y pos. NAME _must be_ a valid key from any System.types's keys dict.
func set_item(ar_layer, x, y, ar_name):
	if (layers[ar_layer].values().has(str(str(x) + " " + str(y))) == false):
		var nname = (ar_name + str(first_free_number(ar_name,ar_layer)))
		layers[ar_layer][nname] = (str(str(x) + " " + str(y)))
		var adding_item = System.types[ar_layer][ar_name].instance()
		adding_item.set_meta("type", str(ar_name))
		adding_item.set_name(nname)
		adding_item.set_pos(Vector2(x,y))
		add_child(adding_item)
	else:
		return (false)


# Remove a item at_layer by it's name.
func remove_item(at_layer, name):
	for key in layers[at_layer].keys():
		if (layers[at_layer].keys().has(name)):
			layers[at_layer].erase(name)
			remove_child(get_node(name))
			return (true)
	return (false)

# It gets a name of item and cheching first free number in 'objects', i.e.:
# We have: v, v1, v2, v3, v5, v6
# it will return '4' ... in theory

# object_type,layer są stringami i nie są nullami
func first_free_number(object_type,layer):
	assert(object_type != null)
	assert(layer != null)
	var ii = 0
	for i in get_children():
			if i.get_meta("type") == object_type:
				ii += 1
	if ii == 0:
		return ("")
	elif ii == 1:
		if not(layers[layer].keys().has(object_type)):
			return ("")
		elif not(layers[layer].keys().has(object_type+" 1")):
			return (str(" 1"))
	elif ii >= 2:
		for ran in range(1,ii+1):
			if not(layers[layer].keys().has(object_type+" "+str(ran))):
				return (str(" "+str(ran)))
	else:
		print("ERROR: wrong number in first_free_number at Level/Layers")
		assert(false)
		

var x = 0
var y = 0