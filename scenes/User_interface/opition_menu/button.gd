
extends Control

export var name_of_item = ""
export var layer = ""
export var texture_src = ""
func _ready():
	add_user_signal("pressed_user",[{"name_of_creating_item":TYPE_STRING},{"layer_in_level":TYPE_STRING}])
	connect("pressed_user",get_node("../../../"),"recived_signal_from_btt")
	
	
	var texture = load(texture_src)

	get_node("button_bgr").set_size(Vector2(32,32))
	var scale = Vector2(32/float(texture.get_width()),32/float(texture.get_height()))
	#	var scale = Vector2(pow(32/texture.get_width(),2),pow(32/texture.get_height(),2))
	get_node("icon").set_pos(Vector2(32/float(texture.get_width())+16,32/float(texture.get_height())+16))
#	get_node("icon").set_scale(Vector2(1,1))
	get_node("icon").set_scale(scale)
	get_node("icon").set_texture(texture)

func _on_button_pressed():
	emit_signal("pressed_user",name_of_item,layer)