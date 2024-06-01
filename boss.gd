extends RigidBody2D
@export var player_3_scene:PackedScene
var player
var boss_wave
func _ready():
	pass

const BOSS_SPEED = 200
var dir = Vector2(0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#We want to get the player's position via vector EVERY FRAME
	#We want to move towards the player using a vector/line pathing
	if player != null and boss_wave:
		var player_difference = player.position - position
		dir = player_difference.normalized() * BOSS_SPEED
		#var move = direction * SNAKE_SPEED * _delta
#
		#var new_pos = position + move
		#position = new_pos
		#$CollisionShape2D.position = new_pos


func _integrate_forces(state):
	state.apply_force(dir)
	
func follow_player(player_to_follow):
	player = player_to_follow
