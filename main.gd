extends Node
var Enemy_Count

# Called when the node enters the scene tree for the first time.
func _ready():
	
	print ("hi")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("W"):
		get_tree().change_scene_to_file("res://Player 2.0.tscn")



func _on_shop_button_button_down():
	get_tree().change_scene_to_file("res://shop.tscn")
