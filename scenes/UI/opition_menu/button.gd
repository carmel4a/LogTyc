
extends Control

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	var name = get_name().replace("button_","")
	var layer = get_parent().get_name().replace("grid_","")
	add_user_signal("pressed_user",[{"name_of_creating_item":TYPE_STRING},{"layer_in_level":TYPE_STRING}])
	# W T F?
	connect("pressed",self,"clicked")
#	get_node("button_bgr").connect("pressed",self,"clicked")
	connect("pressed_user",get_node("../../"),"recived_signal_from_bttn",[name,layer])
func clicked():
#	disconnect("pressed",self,"clicked")
	
	emit_signal("pressed_user")
#	disconnect()
