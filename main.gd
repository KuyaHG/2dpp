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
#*Make the boss have more hp

#Make the rage mode scene
#Make the input for rage mode
#Get rage mode to change the speed variable for player
#Get rage mode to change the damage bullets do

#Ideas
#punishment for accessing the shop: speed go nyooooooooooom

var screen_size

var EnemiesNode
var BossesNode
var player
var boss_wave

# Called when the node enters the scene tree for the first time.
func _ready():
	EnemiesNode = $Enemies
	BossesNode = $Bosses
	screen_size = $Background.get_viewport_rect().size
	player = $"player 3"
	
	var enemiesToSpawn = Global.NumEnemiesSpawned - Global.NumEnemiesKilled
	var bossesToSpawn =  Global.NumBossesSpawned - Global.NumBossesKilled
	
	for i in enemiesToSpawn:
		print ("spawning enemy {i}".format({"i": i}))
		spawn_enemy(true)

	for i in bossesToSpawn:
		print ("spawning boss {i}".format({"i": i}))
		spawn_boss(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#if Input.is_action_pressed("W"):
		#get_tree().change_scene_to_file("res://Player 2.0.tscn")
	if Global.NumEnemiesSpawned - EnemiesNode.get_child_count() == Global.NumWaveEnemies:
		pass
	if Input.is_action_pressed("Rage mode"):
		if $"UI/Rage GUI".animation == "empty":
			pass
		if $"UI/Rage GUI".animation == "1_4":
			if Global.rage_cooldown:
				$"UI/Rage GUI".animation = "empty"
				Global.speed = 600
				Global.rage_cooldown = false
				$Rage_duration_timer.start()
				pass
		if $"UI/Rage GUI".animation == "2_4":
			if Global.rage_cooldown:
				$"UI/Rage GUI".animation = "1_4"
				Global.speed = 600
				Global.rage_cooldown = false
				$Rage_duration_timer.start()
				pass
		if $"UI/Rage GUI".animation == "3_4":
			if Global.rage_cooldown:
				$"UI/Rage GUI".animation = "2_4"
				Global.speed = 600
				Global.rage_cooldown = false
				$Rage_duration_timer.start()
				pass
		if $"UI/Rage GUI".animation == "full":
			if Global.rage_cooldown:
				$"UI/Rage GUI".animation = "3_4"
				Global.speed = 600
				Global.rage_cooldown = false
				$Rage_duration_timer.start()
				pass
func _on_shop_button_button_down():
	Global.shopentered += 1
	get_tree().change_scene_to_file("res://shop.tscn")
	#var Enemy_Count = EnemiesNode.get_child_count()
	#if (Enemy_Count > 0):
		#EnemiesNode.remove_child(EnemiesNode.get_child(0))

func spawn_enemy(skip_count = false):
	# print ("Spawn Snake")
	if !skip_count:
		Global.NumEnemiesSpawned += 1

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


func spawn_boss(skip_count = false):
	print ("Spawn Boss")
	if !skip_count:
		Global.NumBossesSpawned += 1

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

func _on_enemy_spawn_timer_timeout():
	# print ("Checking to spawn enemies...")
	var Enemy_Count = EnemiesNode.get_child_count()
	if Enemy_Count < Global.MaxEnemiesOnScreen and Global.NumEnemiesSpawned < Global.NumWaveEnemies:
		spawn_enemy()

	var Boss_Count = BossesNode.get_child_count()
	if Boss_Count < Global.MaxBossesOnScreen and Global.NumBossesSpawned < Global.NumWaveBosses and Global.NumEnemiesKilled > 2:
		boss_wave = true
		spawn_boss()



func _on_rage_duration_timer_timeout():
	if Global.rage:
		Global.rage = false
	Global.speed = 400
	Global.rage_cooldown = true
	print ("Rage timer out")
	
