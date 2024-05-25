extends Control

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")


func _on_shop_pressed():
	if get_tree().paused == false:
		pause()


func _on_resume_pressed():
	resume()
