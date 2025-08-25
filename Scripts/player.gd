extends CharacterBody2D

@export var gravity := 17000.0
@export var jump_force := 12000.0
var dead = false

@onready var anim = $AnimatedSprite2D
@onready var sfx : AudioStreamPlayer2D = $PlayerSoundEfect
@onready var sfx_timer: Timer = $PlayerSoundEfect/Timer

var sfx_run = load("res://Sounds/Efects/ninja_breath.wav")
var sfx_jump = load("res://Sounds/Efects/ninja_jump.wav")
var sfx_death = load("res://Sounds/Efects/ninja_death.mp3")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y = gravity * delta
	else:
		velocity.y = 0
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		sfx.stream = sfx_jump
		sfx.play()
		velocity.y = -jump_force
	if not is_on_floor():
		anim.play("Jump")
	elif dead:
		anim.play("Dead")
	else:
		if sfx_timer.is_stopped():
			sfx.stream = sfx_run
			sfx.play()
			sfx_timer.start(1.0)
		anim.play("Run")
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Dangerous"):
		dead = true
		sfx.stream = sfx_death
		sfx.play()
		GameManager.world_speed = 0
		GameManager.world_acceleration = 0
		await get_tree().create_timer(.8).timeout
		var main = get_tree().get_current_scene()
		main.on_player_dead()
