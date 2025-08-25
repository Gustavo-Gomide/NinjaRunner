extends Node2D

const STATUE_OBSTACLE = preload("res://Scenes/statue_obstacle.tscn")

const GROUND_Y = 225

func spawn_object():
	var packed: PackedScene
	
	packed = STATUE_OBSTACLE
	
	var inst = packed.instantiate()
	
	inst.position.x = get_viewport_rect().size.x + 20
	inst.position.y = GROUND_Y
	
	get_parent().add_child(inst)

func _on_spawn_timer_timeout() -> void:
	spawn_object()
