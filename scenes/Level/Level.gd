#######################################################
#                                                     #
# Main level node.                                    #
# There will be a map generator and metainfo          #
# to recreating level (money, quests, scenario, etc). #
#                                                     #
#######################################################
extends Node

onready var tilemap = get_node("TileMap")

# Map size must be even!
var map_size = Vector2(20,20)

# Seed
var v_seed = 0


func _ready():
	tilemap.clear()
	if v_seed == 0:
		randomize()
	else:
		seed(v_seed)
	# There will be methods to generate level
	generate()
#	river_test()
	
	
func river_test():
	for x in range(map_size.x):
		for y in range(map_size.y):
			tilemap.set_cell(x-map_size.x/2,y-map_size.x/2,0)
	var start_river = [floor(rand_range(1,map_size.x-1)),floor(rand_range(1,map_size.y-1))]
	var end_river = [0,0]
	if start_river[0]>=start_river[1]:
		if start_river[0]-(map_size.x/2-1)<=start_river[1]-(map_size.y/2-1):
			end_river = [map_size.x-1,floor(rand_range(0,map_size.y))]
		else:
			end_river = [floor(rand_range(0,map_size.y-1)),0]
	elif (map_size.x/2-1)-start_river[0]>=-(map_size.y/2-1)-start_river[1]:
		end_river = [0,floor(rand_range(0,map_size.y))]
	else:
		end_river = [floor(rand_range(0,map_size.x-1)),map_size.y]
	tilemap.set_cell(end_river[0]-map_size.x/2,end_river[1]-map_size.x/2,1)
	tilemap.set_cell(start_river[0]-map_size.x/2,start_river[1]-map_size.x/2,1)

	
	var riv_drc = Vector2(end_river[0]-start_river[0],end_river[1]-start_river[1])
	var dir = 0

	if ((abs(riv_drc.angle()/PI) >= (0.25)) and (abs(riv_drc.angle()/PI) <= (0.75))):
		if riv_drc.x>0:
			dir ="r"
		else:
			dir ="l"
	elif riv_drc.y>0:
		dir ="d"
	else:
		dir ="u"
	var act_cell = Vector2(start_river[0],start_river[1])
#	while(not((act_cell.x==start_river[0]) and ((act_cell.y==start_river[1])))):
#		if randi()$101>75:


	
func generate():
	for x in range(map_size.x):
		for y in range(map_size.y):
			if tilemap.get_cell(x-map_size.x/2,y-map_size.y/2) == -1:
				if  randf()>=0.01:
					tilemap.set_cell(x-map_size.x/2,y-map_size.x/2,0)
				else:
					generate_dirt_plain(x,y)
				y = y + 1
			else:
				y = y + 1
		x  = x +1
	generate__polish_eges()
	
	
func generate_dirt_plain(x,y):
	tilemap.set_cell(x-map_size.x/2,y-map_size.x/2,1)
	var size_plain = round(rand_range(0,4))

	for px in range(size_plain):
		for py in range(size_plain):
			tilemap.set_cell(x-map_size.x/2-size_plain+px,y-map_size.x/2-size_plain+py,1)
			py = py + 1
		px = px + 1


func generate__polish_eges():
	pass
#	var end_polishing = 0
#	while end_polishing !=1:
#		end_polishing = 1
#		for x in range(200):
#			for y in range(200):
#				if tilemap.get_cell(x-map_size.x/2,y-map_size.y/2) == 0:
#					var l = 0
#					var r = 0
#					var t = 0
#					var b = 0
#					if tilemap.get_cell(x-map_size.x/2,y-map_size.y/2+1) == 1:
#						t = 1
#					if tilemap.get_cell(x-map_size.x/2+1,y-map_size.y/2) == 1:
#						r = 1
#					if tilemap.get_cell(x-map_size.x/2,y-map_size.y/2-1) == 1:
#						b = 1
#					if tilemap.get_cell(x-map_size.x/2-1,y-map_size.y/2) == 1:
#						l = 1
#					var a = [l,t,r,b]
#					var err = 0
#					for i in a:
#						if a[i] == 1:
#							err = err + 1
#					if err < 2:
#						if t == 1:
#							tilemap.set_cell(x-map_size.x/2,y-map_size.y/2,7)
#						if b == 1:
#							tilemap.set_cell(x-map_size.x/2,y-map_size.y/2,4)
#						if l == 1:
#							tilemap.set_cell(x-map_size.x/2,y-map_size.y/2,3)
#						if r == 1:
#							tilemap.set_cell(x-map_size.x/2,y-map_size.y/2,2)
#					else:
#						end_polishing = 0
#						tilemap.set_cell(x-map_size.x/2,y-map_size.y/2,1)
#				y = y + 1
#			x = x + 1
