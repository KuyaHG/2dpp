extends CanvasLayer
var timer := Timer.new()

func _ready():
	pass

#I deleted this in favor of putting the button in the game scene
func _process(delta):
	if Input.is_action_pressed("D"):
		get_tree().change_scene_to_file("res://main.gd")
	
	
func _on_timer_timeout():
	get_tree().paused = true
	$AnimationPlayer.play("Fade_In")
