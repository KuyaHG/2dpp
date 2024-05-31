extends Node
@export var snake_enemy_scene:PackedScene
#THINGS TO DO
#*Game over screen
#*Game over screen restart button
#*Snake collision with player
#  transitions to game over

#*Game start screen
#*Game start button
#*Start game on start screen
#*Change game over button to start screen (not main)

#*Snakes are created at different positions --Go over with dad

#*Snakes move towards player

#Player can spawn bullets
#Bullets move
#Bullet leaves screen and is deleted
#Bullet collision with snake kills snake
#Bullet collision with snake kills bullet

#*Create win screen
#*Win Screen reset button transitions to start screen

#When snake dies numSnakesKilled increases
#When NumSnakesKilled==WaveNumSnakes transition to win screen

	

var EnemiesNode
var NumWaveEnemies
var MaxEnemiesOnScreen
var NumberOfEnemiesKilled


# Called when the node enters the scene tree for the first time.
func _ready():
	NumWaveEnemies=10
	MaxEnemiesOnScreen=2
	NumberOfEnemiesKilled=0
	EnemiesNode = $Enemies

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_action_pressed("W"):
		#get_tree().change_scene_to_file("res://Player 2.0.tscn")
	if NumberOfEnemiesKilled == NumWaveEnemies:
		get_tree().change_scene_to_file("res://game_win.tscn")
	

func _on_shop_button_button_down():
	#get_tree().change_scene_to_file("res://shop.tscn")
	var Enemy_Count = EnemiesNode.get_child_count()
	if (Enemy_Count > 0):
		EnemiesNode.remove_child(EnemiesNode.get_child(0))
		NumberOfEnemiesKilled += 1

func spawn_enemy():
	print ("Spawn Snake")
	var snake = snake_enemy_scene.instantiate()
	snake.position = Vector2(400 + (randf() * 400), 400 + (randf() * 400))

	snake.follow_player($"player 3")

	EnemiesNode.add_child(snake)
	
func _on_enemy_spawn_timer_timeout():
	print ("Checking to spawn enemies...")
	var Enemy_Count = EnemiesNode.get_child_count()
	if Enemy_Count<MaxEnemiesOnScreen and NumberOfEnemiesKilled+Enemy_Count<NumWaveEnemies:
		spawn_enemy()
