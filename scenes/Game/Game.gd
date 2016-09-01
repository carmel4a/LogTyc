####################################################
#                                                  #
# Main "in game" scene.                            #
# Here will be everything wich hppens in gameplay. #
#                                                  #
####################################################

extends Node
var paused = 1

func _ready():
	get_node("tick_timer").set_active(true)
	set_process(true)
func _process(delta):
	print(paused)
	if Input.is_action_pressed("ui_select") == true:
		if paused == 1:
			get_node("tick_timer").set_wait_time(0.5)
			get_node("tick_timer").start()
			paused = 0
		else:
			get_node("tick_timer").stop()
			paused = 1
		