
extends Patch9Frame
var hidden = 0
# left, top, right, botton
var texture_margin = [14,6,8,8]
var btt_mar = 8
var btt_b_mar = 8
var icon_size = 32
func _ready():
	for i in range(0,4):
		set_patch_margin(i, texture_margin[i])
	set_anchor_and_margin(1,1,(icon_size + texture_margin[3] + texture_margin[1] + btt_mar))
	set_anchor_and_margin(0,3,(get_node("Buttons").get_child_count()*icon_size+ 2*btt_mar + (get_node("Buttons").get_child_count()-1)*btt_b_mar+texture_margin[0]+texture_margin[2])/2)
	set_anchor_and_margin(2,3,-(get_node("Buttons").get_child_count()*icon_size+ 2*btt_mar + (get_node("Buttons").get_child_count()-1)*btt_b_mar +texture_margin[0]+texture_margin[2])/2)
	set_anchor_and_margin(3,1,0)
	set_size(Vector2(get_node("Buttons").get_child_count()*icon_size+ 2*btt_mar + (get_node("Buttons").get_child_count()-1)*btt_b_mar +texture_margin[0]+texture_margin[2],icon_size + texture_margin[3] + texture_margin[1] + btt_mar))
	get_node("hide_button").set_pos(Vector2(get_node("Buttons").get_child_count()*icon_size+ 2*btt_mar + (get_node("Buttons").get_child_count()-1)*btt_b_mar +texture_margin[0]+texture_margin[2]/2-get_node("hide_button").get_size().x/2,-10))
	get_node("Buttons").set_anchor_and_margin(1,0,texture_margin[1]+btt_mar)
	get_node("Buttons").set_anchor_and_margin(0,0,texture_margin[0]+btt_mar)
	get_node("Buttons").set_anchor_and_margin(2,1,texture_margin[2]+btt_mar)
	get_node("Buttons").set_anchor_and_margin(3,1,texture_margin[3]+btt_mar)
	get_node("Buttons").set("custom_cons1tants/separation",btt_b_mar)

var type_of_action = 0
func _on_Plan_pressed():
	type_of_action = 0
func _on_Orders_pressed():
	type_of_action = 1
func _on_Stats_pressed():
	type_of_action = 2

