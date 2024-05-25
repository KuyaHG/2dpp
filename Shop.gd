extends CanvasLayer
var timer := Timer.new()

func _ready():
	$AnimationPlayer.play("Start")

func _on_shopbutton_button_down():
	$AnimationPlayer.play("ButtonPressed")
	$Timer.start()

func _on_timer_timeout():
	get_tree().paused = true
	$AnimationPlayer.play("Fade_In")
