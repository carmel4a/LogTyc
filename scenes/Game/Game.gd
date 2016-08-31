####################################################
#                                                  #
# Main "in game" scene.                            #
# Here will be everything wich hppens in gameplay. #
#                                                  #
####################################################

extends Node


func _ready():
	get_node("tick_timer").set_wait_time(0.5)
	get_node("tick_timer").set_active(true)