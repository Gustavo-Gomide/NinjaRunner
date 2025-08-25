extends Node2D

var score := 0.0
@onready var label_score: Label = $CanvasLayer/LabelScore
@onready var player: CharacterBody2D = $Player
@onready var game_over: CanvasLayer = $GameOver
@onready var bg_sound: AudioStreamPlayer = $BG_Sound

func _ready() -> void:
	bg_sound.volume_db = -10

func _process(delta: float) -> void:
	if not player.dead:
		score += delta * 10
		label_score.text = 'Score: ' + str(int(score))
func _physics_process(delta: float) -> void:
	GameManager.load_high_score()
	if GameManager.world_speed < GameManager.max_world_speed:
		GameManager.world_speed += GameManager.world_acceleration * delta

func on_player_dead():
	if score > GameManager.high_score:
		GameManager.high_score = score
		GameManager.save_high_score()
	game_over.show_game_over(int(score), int(GameManager.high_score))
