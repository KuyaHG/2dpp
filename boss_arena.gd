extends Node

@export var player_3_scene:PackedScene
@export var snake_enemy_scene:PackedScene
@export var boss_scene:PackedScene

var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = $"player 3"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
