
extends Control

var x = 5
var y = 5
var margin = 5
var group_margin = 0
var cell_size = 32
var pos = Vector2(0,0)
var anchor
var curr_tab_type
func hide_all():
	get_node("Vech").hide()
	get_node("Label1").set_text("")

func _ready():
	get_node("Vech/Button").add_user_signal("pressed_n",[{"name":TYPE_STRING}])
	
func _on_Button_pressed():
	hide()


func _on_Vech_pressed():
	hide_all()
	get_node("Vech").show()
	get_node("Label").set_text(tr("VECH"))

func _on_Infr_pressed():
	hide_all()
	get_node("Label").set_text(tr("INFRA"))


func _on_Button_vech_v1_pressed():
	get_node("Label1").set_text("Vehicle 1")
	get_node("Vech/Button").disconnect("pressed",get_parent().get_parent(),"_on_Button_vech_v1_pressed")
	get_node("Vech/Button").connect("pressed_n",get_node("../../Level/Layers/Vehicles"),"_on_veh_choosed")
	get_node("Vech/Button").emit_signal("pressed_n", "Veh1")
	get_node("Vech/Button").disconnect("pressed_n",get_node("../../Level/Layers/Vehicles"),"_on_veh_choosed")
	get_node("Vech/Button").connect("pressed",get_parent().get_parent(),"_on_Button_vech_v1_pressed")