extends Node

var NumWaveEnemies
var NumWaveBosses
var MaxEnemiesOnScreen
var MaxBossesOnScreen
var NumEnemiesSpawned
var NumBossesSpawned
var NumEnemiesKilled
var NumBossesKilled


var piercing_upgrade = false

func reset():
	NumWaveEnemies=3
	NumWaveBosses=1
	MaxEnemiesOnScreen=20
	MaxBossesOnScreen=1
	NumEnemiesSpawned=0
	NumBossesSpawned=0
	NumEnemiesKilled=0
	NumBossesKilled=0

	piercing_upgrade = false

func buy_piercing_upgrade():
	piercing_upgrade = true
