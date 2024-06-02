extends Node
@export var snake_enemy_scene:PackedScene
@export var player_3_scene:PackedScene
@export var boss_scene:PackedScene
#THINGS TO DO
#*Fix the shop button's graphics
#*Get the button to change scenes to the shop

#Get one upgrade (winchester rifle)
#Make it so when you hover over the upgrade, it says what it does
#Code the upgrade
#Get the other upgrades done, repeating the process listed above

#Get it so when you kill 20 snakes, it changes scene to the boss
#*Make the boss
#*Make the boss go towards the player
#*Make it so when the boss touches you, transition to game_over
#*Make a velocity cap for the boss, or a clamp
#Make the boss have more hp

#Make the rage mode scene
#Make the input for rage mode
#Get rage mode to change the speed variable for player
#Get rage mode to change the damage bullets do
signal Boss_Spawn
var screen_size

var EnemiesNode
var BossesNode
var NumWaveEnemies
var NumWaveBosses
var MaxEnemiesOnScreen
var MaxBossesOnScreen
var NumEnemiesSpawned
var NumBossesSpawned
var NumEnemiesKilled
var NumBossesKilled
var player
var boss_wave

# Called when the node enters the scene tree for the first time.
func _ready():
	NumWaveEnemies=3
	NumWaveBosses=1
	MaxEnemiesOnScreen=20
	MaxBossesOnScreen=1
	NumEnemiesSpawned=0
	NumBossesSpawned=0
	NumEnemiesKilled=0
	NumBossesKilled=0
	EnemiesNode = $Enemies
	BossesNode = $Bosses
	screen_size = $Background.get_viewport_rect().size
	player = $"player 3"

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
	snake.set_main_scene(self)

	snake.apply_scale(Vector2(2,2)) # big for a second?

	EnemiesNode.add_child(snake)


func spawn_boss():
	print ("Spawn Boss")
	NumBossesSpawned += 1
	var spawn_position_1 = Vector2(400, 90)
	var spawn_position_2 = Vector2(400, screen_size.y - 180)
	var spawn_position

	# Don't let boss spawn on top of the player
	if (player.position.y < screen_size.y / 2):
		spawn_position = spawn_position_2
	else:
		spawn_position = spawn_position_1

	var boss = boss_scene.instantiate()
	boss.position = spawn_position

	boss.follow_player(player)
	boss.set_main_scene(self)

	#boss.apply_scale(Vector2(2,2)) # big for a second?

	BossesNode.add_child(boss)

func enemy_died():
	print ("Main sees that an enemy died")
	NumEnemiesKilled += 1

func boss_died():
	print ("Main sees that a boss died")
	NumBossesKilled += 1

func _on_enemy_spawn_timer_timeout():
	# print ("Checking to spawn enemies...")
	var Enemy_Count = EnemiesNode.get_child_count()
	if Enemy_Count < MaxEnemiesOnScreen and NumEnemiesSpawned < NumWaveEnemies:
		spawn_enemy()

	var Boss_Count = BossesNode.get_child_count()
	if Boss_Count < MaxBossesOnScreen and NumBossesSpawned < NumWaveBosses and NumEnemiesKilled > 2:
		boss_wave = true
		spawn_boss()

