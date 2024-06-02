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

func reset():
	NumWaveEnemies=3
	NumWaveBosses=1
	MaxEnemiesOnScreen=20
	MaxBossesOnScreen=1
	NumEnemiesSpawned=0
	NumBossesSpawned=0
	NumEnemiesKilled=0
	NumBossesKilled=0
	Weapon = WEAPON.HANDGUN

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
