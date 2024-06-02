extends Node

enum WEAPON {HANDGUN, RIFLE}

var NumWaveEnemies
var NumWaveBosses
var MaxEnemiesOnScreen
var MaxBossesOnScreen
var NumEnemiesSpawned
var NumBossesSpawned
var NumEnemiesKilled
var NumBossesKilled
var Weapon
var Money

var CurrentWaveNumber

var Waves = [
	{
		'NumEnemies': 3,
		'NumBosses': 1,
		'MaxEnemiesOnScreen': 20,
		'MaxBossesOnScreen': 1,
	},
	{
		'NumEnemies': 10,
		'NumBosses': 2,
		'MaxEnemiesOnScreen': 20,
		'MaxBossesOnScreen': 1,
	}
]

func start_wave():
	var CurrentWave = Waves[CurrentWaveNumber]
	NumWaveEnemies = CurrentWave['NumEnemies']
	NumWaveBosses = CurrentWave['NumBosses']
	MaxEnemiesOnScreen = CurrentWave['MaxEnemiesOnScreen']
	MaxBossesOnScreen = CurrentWave['MaxBossesOnScreen']
	NumEnemiesSpawned = 0
	NumBossesSpawned = 0
	NumEnemiesKilled = 0
	NumBossesKilled = 0

func reset():
	CurrentWaveNumber = 0
	Weapon = WEAPON.HANDGUN
	Money = 0
	start_wave()
	
func buy_weapon(weapon_to_buy):
	Weapon = weapon_to_buy

func is_weapon_piercing():
	if Weapon == WEAPON.RIFLE:
		return true
	
	return false

func weapon_damage():
	if Weapon == WEAPON.RIFLE:
		return 2
	
	return 1

func weapon_speed():
	if Weapon == WEAPON.RIFLE:
		return 1000

	return 700

func weapon_cooldown():
	if Weapon == WEAPON.RIFLE:
		return 800

	return 500

func enemy_died():
	print ("Global sees that an enemy died")
	NumEnemiesKilled += 1
	Money += 1

func boss_died():
	print ("Global sees that a boss died")
	NumBossesKilled += 1
	Money += 3

	get_tree().change_scene_to_file.bind("res://game_win.tscn").call_deferred()

