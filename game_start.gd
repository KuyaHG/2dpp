extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.reset()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_start_button_button_down():
	get_tree().change_scene_to_file("res://main.tscn")
