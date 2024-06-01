extends Node
@export var snake_enemy_scene:PackedScene
@export var player_3_scene:PackedScene
@export var boss_scene:PackedScene
#THINGS TO DO
#*Fix the shop button's graphics
#Get the button to change scenes to the shop

#Get one upgrade (winchester rifle)
#Make it so when you hover over the upgrade, it says what it does
#Code the upgrade
#Get the other upgrades done, repeating the process listed above

#Get it so when you kill 20 snakes, it changes scene to the boss
#*Make the boss
#Make the boss go towards the player
#Make the boss shoot bullets (interpret this how you would like)
#Make it so when the boss touches you, transition to game_over
#
signal Boss_Spawn
var screen_size

var EnemiesNode
var NumWaveEnemies
var MaxEnemiesOnScreen
var NumEnemiesSpawned
var NumEnemiesKilled
var player
var boss
var boss_wave

# Called when the node enters the scene tree for the first time.
func _ready():
	NumWaveEnemies=3
	MaxEnemiesOnScreen=20
	NumEnemiesSpawned=0
	NumEnemiesKilled=0
	EnemiesNode = $Enemies
	screen_size = $Background.get_viewport_rect().size
	player = $"player 3"
	boss = $"boss"
	
	boss.position.x = -100
	boss.position.y = -100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#if Input.is_action_pressed("W"):
		#get_tree().change_scene_to_file("res://Player 2.0.tscn")
	if NumEnemiesSpawned - EnemiesNode.get_child_count() == NumWaveEnemies:
		pass
	

func _on_shop_button_button_down():
	get_tree().change_scene_to_file("res://shop.tscn")
	#var Enemy_Count = EnemiesNode.get_child_count()
	#if (Enemy_Count > 0):
		#EnemiesNode.remove_child(EnemiesNode.get_child(0))

func spawn_enemy():
	# print ("Spawn Snake")
	NumEnemiesSpawned += 1
	var spawn_position = Vector2(randf() * screen_size.x, randf() * screen_size.y)

	# Don't let snakes spawn on top of the player
	while spawn_position.x > player.position.x - 100 and spawn_position.x < player.position.x + 100 and spawn_position.y > player.position.y - 100 and spawn_position.y < player.position.y + 100:
		spawn_position = Vector2(randf() * screen_size.x, randf() * screen_size.y)

	var snake = snake_enemy_scene.instantiate()
	snake.position = spawn_position

	snake.follow_player(player)
	snake.apply_scale(Vector2(2,2)) # big for a second?

	EnemiesNode.add_child(snake)
	
func _on_enemy_spawn_timer_timeout():
	# print ("Checking to spawn enemies...")
	var Enemy_Count = EnemiesNode.get_child_count()
	if Enemy_Count < MaxEnemiesOnScreen and NumEnemiesSpawned < NumWaveEnemies:
		spawn_enemy()
	if NumEnemiesKilled > 2:
		player.position.x = 400
		player.position.y = 600
		boss.position.x = 400
		boss.position.y = 90
		boss_wave = true
