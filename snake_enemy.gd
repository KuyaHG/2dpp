extends RigidBody2D

var player

# Called when the node enters the scene tree for the first time.
func _ready():
	#We want to either set a random place for the snake to spawn
	#or set an order of how many they needed to spawn in a place
	#var mob_types = $AnimatedSprite2D.sprite_frames

	pass

const SNAKE_SPEED = 100
var dir = Vector2(0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#We want to get the player's position via vector EVERY FRAME
	#We want to move towards the player using a vector/line pathing
	if player != null:
		var player_difference = player.position - position
		dir = player_difference.normalized() * SNAKE_SPEED
		#var move = direction * SNAKE_SPEED * _delta
#
		#var new_pos = position + move
		#position = new_pos
		#$CollisionShape2D.position = new_pos


func _integrate_forces(state):
	state.apply_force(dir)

func die():
	get_parent().remove_child(self)

func follow_player(player_to_follow):
	player = player_to_follow
