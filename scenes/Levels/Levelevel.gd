
extends Node
var map_size = Vector2(200,200)
var v_seed = 0
# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	if v_seed == 0:
		randomize()
	else:
		seed(v_seed)
	generate()

func generate():
	for x in range(200):
		for y in range(200):
			if get_node("TileMap").get_cell(x-map_size.x/2,y-map_size.y/2) == -1:
				if rand_range(0,1)>=0.05:
					get_node("TileMap").set_cell(x-map_size.x/2,y-map_size.x/2,0)
				else:
					generate_dirt_plain(x,y)
				y = y + 1
			else:
				y = y + 1
		x  = x +1
	generate__polish_eges()
	
func generate_dirt_plain(x,y):
	get_node("TileMap").set_cell(x-map_size.x/2,y-map_size.x/2,1)
	var size_plain = round(rand_range(0,4))

	for px in range(size_plain):
		for py in range(size_plain):
			get_node("TileMap").set_cell(x-map_size.x/2-size_plain+px,y-map_size.x/2-size_plain+py,1)
			py = py + 1
		px = px + 1

func generate__polish_eges():
	pass
#	var end_polishing = 0
#	while end_polishing !=1:
#		end_polishing = 1
#		for x in range(200):
#			for y in range(200):
#				if get_node("TileMap").get_cell(x-map_size.x/2,y-map_size.y/2) == 0:
#					var l = 0
#					var r = 0
#					var t = 0
#					var b = 0
#					if get_node("TileMap").get_cell(x-map_size.x/2,y-map_size.y/2+1) == 1:
#						t = 1
#					if get_node("TileMap").get_cell(x-map_size.x/2+1,y-map_size.y/2) == 1:
#						r = 1
#					if get_node("TileMap").get_cell(x-map_size.x/2,y-map_size.y/2-1) == 1:
#						b = 1
#					if get_node("TileMap").get_cell(x-map_size.x/2-1,y-map_size.y/2) == 1:
#						l = 1
#					var a = [l,t,r,b]
#					var err = 0
#					for i in a:
#						if a[i] == 1:
#							err = err + 1
#					if err < 2:
#						if t == 1:
#							get_node("TileMap").set_cell(x-map_size.x/2,y-map_size.y/2,7)
#						if b == 1:
#							get_node("TileMap").set_cell(x-map_size.x/2,y-map_size.y/2,4)
#						if l == 1:
#							get_node("TileMap").set_cell(x-map_size.x/2,y-map_size.y/2,3)
#						if r == 1:
#							get_node("TileMap").set_cell(x-map_size.x/2,y-map_size.y/2,2)
#					else:
#						end_polishing = 0
#						get_node("TileMap").set_cell(x-map_size.x/2,y-map_size.y/2,1)
#				y = y + 1
#			x = x + 1