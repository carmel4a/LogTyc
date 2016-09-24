
extends Button

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _on_REGENERATE_pressed():
	
	get_node("../../Level")._ready()
	