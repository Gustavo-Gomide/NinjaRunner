extends Area2D

var off_screen_x := -50.0

func _physics_process(delta: float) -> void:
	position.x -= GameManager.world_speed * delta
	
	if position.x < off_screen_x:
		queue_free()
