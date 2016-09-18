
extends Node
var x
var y
var sq = 1
var unkeep = 0.3
var walk={"frames":16}
func _ready():
#	get_node("AnimationPlayer").play("Walk")
	set_process(true)
func _process(delta):
	
	analize()
	work()
	
func analize():
	pass
func work():
	pass
	
	
func walk():
	for i in range(get_node("spritles/walk").get_child_count()):
		if get_node("spritles/walk").get_children()[i].get_region_rect().pos.x!=64*15:
			get_node("spritles/walk").get_children()[i].set_region_rect(Rect2(get_node("spritles/walk").get_children()[i].get_region_rect().pos+Vector2(64,0),get_node("spritles/walk").get_children()[i].get_region_rect().size))
		else:
			get_node("spritles/walk").get_children()[i].set_region_rect(Rect2(Vector2(64,0),get_node("spritles/walk").get_children()[i].get_region_rect().size))
			
