extends Control
# Self generate node to show left option menu
var max_colums = 3
var grid_h_separation = 5
var grid_v_separation = 5
var part_margin = 8
var icon_size = 32
var left_margin = 10
# Globals reference to main chirldren ofnode
onready var exit_button = TextureButton.new()
onready var top_label = Label.new()
onready var main_grid = GridContainer.new()

func _ready():
	# Create a top label
	add_child(top_label)
	top_label.set_pos(Vector2(left_margin,15))
	top_label.set_text(tr("BUY"))
	# Create a grid for main tabs like bldgs, vehs, etc
	add_child(main_grid)	
	main_grid.set_columns(max_colums)
	main_grid.set("custom_constants/hseparation",grid_h_separation)
	main_grid.set("custom_constants/vseparation",grid_v_separation)
	main_grid.set_pos(Vector2(left_margin, top_label.get_pos().y + top_label.get_size().y + part_margin))
	main_grid.set_name("main_grid")
	
	var normal = preload("res://res/UI/option_menu/button_normal.png")
	var pressed = preload("res://res/UI/option_menu/button_pressed.png")
	
	for i in System.buy.keys():
		var m_b = TextureButton.new()
		main_grid.add_child(m_b)
		m_b.set_name(i)
		m_b.set_custom_minimum_size(Vector2(32,32))
		m_b.connect("pressed",self,"change_tab",[i])
		m_b.set_normal_texture(normal)
		m_b.set_pressed_texture(pressed)
		
		var a = GridContainer.new()
		add_child(a)
		a.set_name("grid_"+i)
		a.set_columns(max_colums)
		a.set("custom_constants/hseparation",grid_h_separation)
		a.set("custom_constants/vseparation",grid_v_separation)
		
		a.hide()
		
		var s = preload("res://scenes/User_interface/opition_menu/button_l.gd")

		print(i)
		for j in System.buy[i]:
			var b = TextureButton.new()
			b.set_name("button_"+j)
			b.set_script(s)
			a.add_child(b)
			
			b.set_custom_minimum_size(Vector2(32,32))
			b.set_normal_texture(normal)
			b.set_pressed_texture(pressed)
			var icon = Sprite.new()
			
			b.add_child(icon)
			icon.set_texture(load("res://res/Icons/"+str(i)+"/"+str(j)+"/icon.png"))
			icon.set_pos(Vector2(16,16))
			

	
	set_size(Vector2(max_colums*icon_size+(max_colums+1)*grid_h_separation+left_margin,get_size().y))
	for i in get_children():
		if i.is_type("GridContainer") == true and i.get_name()!="main_grid":
			i.set_pos(Vector2(left_margin, main_grid.get_pos().y + main_grid.get_size().y+part_margin))

func change_tab(show):
	for i in get_children():
		if i.is_type("GridContainer") == true and i.get_name()!="main_grid":
			i.hide()
		get_node("grid_"+show).show()
		
func recived_signal_from_bttn(btt,lay):
	get_node("../../Level/Layers/"+lay).adding_item(btt)