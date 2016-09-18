####################################################
#                                                  #
# Main "in game" scene.                            #
#                                                  #
#                                                  #
####################################################

extends Node

func _ready():
	get_node("tick_timer").set_active(true)
	get_node("tick_timer").set_wait_time(0.5)	