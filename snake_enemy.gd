extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#We want to either set a random place for the snake to spawn
	#or set an order of how many they needed to spawn in a place
	autoplay = "wiggle wiggle"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#We want to get the player's position
	#We want to move towards the player using a vector/line pathing
	pass


	
