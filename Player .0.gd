extends CharacterBody2D

const SPEED = 250
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	print("Breaking Bad Reference")
func _physics_process(delta):
	# var velocity = Vector2.ZERO
	velocity *= delta
	if Input.is_action_pressed("W"):
		velocity.y = -SPEED
	elif Input.is_action_pressed("S"):
		velocity.y = SPEED
	else:
		velocity.y =  0
		
	if Input.is_action_pressed("D"):
		velocity.x = SPEED
	elif Input.is_action_pressed("A"):
		velocity.x = -SPEED
	else:
		velocity.x = 0
		
	
	
	move_and_slide()
