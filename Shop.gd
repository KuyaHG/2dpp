extends CanvasLayer
@export var main_scene:PackedScene
var timer := Timer.new()

func _ready():
	pass

#I deleted this in favor of putting the button in the game scene
func _process(_delta):
	pass
	
	
func _on_timer_timeout():
	get_tree().paused = true
	$AnimationPlayer.play("Fade_In")


func _on_piercing_upgrade_button_down():
	Global.buy_piercing_upgrade()


func _on_back_button_button_down():
	get_tree().change_scene_to_file.bind("res://main.tscn").call_deferred()
