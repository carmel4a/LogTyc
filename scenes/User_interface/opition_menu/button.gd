
extends Control

export var name_of_item = ""
export var layer = ""
export var texture_src = ""
func _ready():
	add_user_signal("pressed_user",[{"name_of_creating_item":TYPE_STRING},{"layer_in_level":TYPE_STRING}])
	connect("pressed_user",get_node("../../../"),"recived_signal_from_btt")
	
	
	var texture = load(texture_src)
	
	

func _on_button_pressed():
	emit_signal("pressed_user",name_of_item,layer)