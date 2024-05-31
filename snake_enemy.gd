extends RigidBody2D

var player

# Called when the node enters the scene tree for the first time.
func _ready():
	#We want to either set a random place for the snake to spawn
	#or set an order of how many they needed to spawn in a place
	#var mob_types = $AnimatedSprite2D.sprite_frames

	pass

const SNAKE_SPEED = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#We want to get the player's position via vector EVERY FRAME
	#We want to move towards the player using a vector/line pathing
	if player != null:
		var player_difference = player.position - position
		var direction = player_difference.normalized()
		var move = direction * SNAKE_SPEED * _delta

		position += move


func follow_player(player_to_follow):
	player = player_to_follow
