extends Node

var world_speed := 400.0 
var max_world_speed := 600.0
var world_acceleration := 2.0

var high_score := 0.0

var load_file = "user://savegame.dat"

func _ready() -> void:
	load_high_score()

func load_high_score(): 
	
	if FileAccess.file_exists(load_file):
		
		var file = FileAccess.open(load_file, FileAccess.READ)
		high_score = file.get_var()
		
		file.close()
	else:
		high_score = 0

func save_high_score():
	var file = FileAccess.open(load_file, FileAccess.WRITE)
	file.store_var(high_score)
	file.close()

func reset():
	GameManager.world_speed = 400.0
	GameManager.world_acceleration = 2.0
