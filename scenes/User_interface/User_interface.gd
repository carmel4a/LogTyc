
extends CanvasLayer

# Type of action wich user may do, when use right mouse button. 
var type_of_action = 0
# Action wich was chosen. //not shure if it'll be necessary
var chosen_action = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass




func _on_Bulid_btt_pressed():
	type_of_action = 0

func _on_Orders_btt_pressed():
	type_of_action = 1

func _on_Stats_btt_pressed():
	type_of_action = 2