extends Button

func _on_pressed():
	Global.start_wave()
	#get_tree().change_scene_to_file.bind("res://main.tscn")
	get_tree().change_scene_to_file("res://main.tscn")
