extends Control
# Self generate node to show left option menu
var max_colums = 6
var grid_h_separation = 5
var grid_v_separation = 5
var part_margin = 8
var icon_size = 32
# Globals reference to main chirldren ofnode
onready var exit_button = TextureButton.new()
onready var top_label = Label.new()
onready var main_grid = GridContainer.new()

func _ready():
	# Create a top label
	add_child(top_label)
	top_label.set_pos(Vector2(10,15))
	top_label.set_text(tr("BUY"))
	# Create a grid for main tabs like bldgs, vehs, etc
	add_child(main_grid)	
	main_grid.set_columns(max_colums)
	main_grid.set("custom_constants/hseparation",grid_h_separation)
	main_grid.set("custom_constants/vseparation",grid_v_separation)
	main_grid.set_pos(Vector2(top_label.get_pos().x, top_label.get_pos().y + top_label.get_size().y + part_margin))
	main_grid.set_name("main_grid")


	for i in System.buy.keys():
		var m_b = Button.new()
		main_grid.add_child(m_b)
		m_b.set_name("button_"+i)
		m_b.set_custom_minimum_size(Vector2(32,32))
		m_b.connect("pressed",self,"change_tab",[i])
		
		var a = GridContainer.new()
		add_child(a)
		a.set_name("grid_"+i)
		a.set_columns(max_colums)
		a.set("custom_constants/hseparation",grid_h_separation)
		a.set("custom_constants/vseparation",grid_v_separation) #//////////////////////////////// \|/ ///
		a.set_pos(Vector2(top_label.get_pos().x, top_label.get_pos().y + top_label.get_size().y + 50 + part_margin))
		a.hide()
		
		for j in System.buy[i]:
			var b = Button.new()
			a.add_child(b)
			b.set_name(j)
			b.set_custom_minimum_size(Vector2(32,32))
#	set_size(Vector2(main_grid.get_columns()*icon_size+3*grid_h_separation,get_size().y))
func change_tab(show):
	for i in get_children():
		if i.is_type("GridContainer") == true and i.get_name()!="main_grid":
			i.hide()
		get_node("grid_"+show).show()