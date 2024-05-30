extends CanvasLayer
var timer := Timer.new()

func _ready():
	pass

#I deleted this in favor of putting the button in the game scene

func _on_timer_timeout():
	get_tree().paused = true
	$AnimationPlayer.play("Fade_In")
