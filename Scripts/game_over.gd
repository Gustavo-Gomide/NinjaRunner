extends CanvasLayer

@onready var label_score: Label = $LabelScore
@onready var label_record: Label = $LabelRecord

func _ready() -> void:
	visible = false

func show_game_over(current_score : int, high_socre : int):
	label_score.text =  "Score: " + str(current_score)
	label_record.text =  "Record: " + str(high_socre)
	visible = true
	get_tree().paused = true

func restart():
	get_tree().paused = false
	get_tree().reload_current_scene()
	GameManager.reset()

func _unhandled_input(event: InputEvent) -> void:
	if visible and event.is_action_pressed("Jump"):
		restart()

func _on_button_pressed() -> void:
	restart()
