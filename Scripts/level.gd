extends ParallaxBackground

func _physics_process(delta: float) -> void:
	scroll_offset.x -= GameManager.world_speed * delta
