
extends Patch9Frame
var hidden = 0
var txt_mar_l = 14
var txt_mar_t = 6
var txt_mar_r = 8
var txt_mar_b = 0
var btt_mar = 8
var btt_b_mar = 8
var icon_size = 32
func _ready():
	set_patch_margin(0, txt_mar_l)
	set_patch_margin(1, txt_mar_t)
	set_patch_margin(2, txt_mar_r)
	set_patch_margin(3, txt_mar_b)
	set_anchor_and_margin(1,1,(icon_size + txt_mar_b + txt_mar_t + 2*btt_mar))
	set_anchor_and_margin(0,3,(get_node("Buttons").get_child_count()*icon_size+ 2*btt_mar + (get_node("Buttons").get_child_count()-1)*btt_b_mar+txt_mar_l+txt_mar_r)/2)
	set_anchor_and_margin(2,3,-(get_node("Buttons").get_child_count()*icon_size+ 2*btt_mar + (get_node("Buttons").get_child_count()-1)*btt_b_mar +txt_mar_l+txt_mar_r)/2)
	set_anchor_and_margin(3,1,0)
	set_size(Vector2(get_node("Buttons").get_child_count()*icon_size+ 2*btt_mar + (get_node("Buttons").get_child_count()-1)*btt_b_mar +txt_mar_l+txt_mar_r,icon_size + txt_mar_b + txt_mar_t + btt_mar))
	get_node("hide_button").set_pos(Vector2(get_node("Buttons").get_child_count()*icon_size+ 2*btt_mar + (get_node("Buttons").get_child_count()-1)*btt_b_mar +txt_mar_l+txt_mar_r/2-get_node("hide_button").get_size().x/2,-10))
	get_node("Buttons").set_anchor_and_margin(1,0,txt_mar_t+btt_mar)
	get_node("Buttons").set_anchor_and_margin(0,0,txt_mar_l+btt_mar)
	get_node("Buttons").set_anchor_and_margin(2,1,txt_mar_r+btt_mar)
	get_node("Buttons").set_anchor_and_margin(3,1,txt_mar_b+btt_mar)
	get_node("Buttons").set("custom_constants/separation",btt_b_mar)
	
func _on_hide_button_pressed():
#	if hidden == 0:
		get_node("AnimationPlayer").play("Hide")
		hidden = 1
#	else:
		hidden = 0
#		get_node("AnimationPlayer").play_backwards("Hide")

var type_of_action = 0