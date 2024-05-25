extends CharacterBody2D

const SPEED = 300


func _ready():
	pass
	
	
	
func _process(_delta):
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

	move_and_slide()
