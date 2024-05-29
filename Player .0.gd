extends CharacterBody2D

const SPEED = 3
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING

func _physics_process(delta):
	# var velocity = Vector2.ZERO

	if Input.is_action_pressed("W"):
		velocity.y = -SPEED
	elif Input.is_action_pressed("S"):
		velocity.y = SPEED
	else:
		velocity.y = 0
		
	if Input.is_action_pressed("D"):
		velocity.x = SPEED
	elif Input.is_action_pressed("A"):
		velocity.x = -SPEED
	else:
		velocity.x = 0
		
	velocity *= delta
	
	move_and_slide()

#func _process(delta):
	#var velocity = Vector2.ZERO
#
	#if Input.is_action_pressed("W"):
		#velocity.y = -SPEED
	#elif Input.is_action_pressed("S"):
		#velocity.y = SPEED
	#else:
		#velocity.y = 0
		#
	#if Input.is_action_pressed("D"):
		#velocity.x = SPEED
	#elif Input.is_action_pressed("A"):
		#velocity.x = -SPEED
	#else:
		#velocity.x = 0
	#
	#var new_velocity = velocity * delta
	#move_and_collide(new_velocity)
	#
	##if velocity.x != 0 and velocity.y != 0:
		##velocity.x /= 1.41421356
		##velocity.y /= 1.41421356
	#
