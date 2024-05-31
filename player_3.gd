extends Area2D
@export var bullet_up_scene:PackedScene
@export var bullet_left_scene:PackedScene
@export var bullet_down_scene:PackedScene
@export var bullet_right_scene:PackedScene
var speed = 400
var screen_size
signal hit
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var velocity = Vector2.ZERO 
	if Input.is_action_pressed("D"):
		velocity.x += 1
	if Input.is_action_pressed("A"):
		velocity.x -= 1
	if Input.is_action_pressed("S"):
		velocity.y += 1
	if Input.is_action_pressed("W"):
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	#player clamp
		position += velocity * _delta
	position = position.clamp(Vector2.ZERO, screen_size)
	#bullets
	if Input.is_action_pressed("Shoot U"):
		pass
	if Input.is_action_pressed("Shoot L"):
		pass
	if Input.is_action_pressed("Shoot D"):
		pass
	if Input.is_action_pressed("Shoot R"):
		pass

func _on_body_entered(_body):
	# hit.emit()
	print("I'M HIT AOFHASIPDFUHSIOFGUOAIGHB")
	get_tree().change_scene_to_file("res://game_over.tscn")
