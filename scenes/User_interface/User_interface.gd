##########################################################
#                                                        #
# This is node wich controls main functions of UI, i.e.  #
# stores globals. Every part of UI should be autonomous. #
# Members shoul be necessary.                            #
#                                                        #
##########################################################


extends CanvasLayer

# Type of action wich user may do, when use right mouse button. 
var type_of_action = 0

func _ready():
	pass

# Managing signals
# Singals fron botton buttons
func _on_Bulid_btt_pressed():
	type_of_action = 0
func _on_Orders_btt_pressed():
	type_of_action = 1
func _on_Stats_btt_pressed():
	type_of_action = 2