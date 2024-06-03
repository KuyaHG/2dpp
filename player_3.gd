extends Area2D
@export var bullet_up_scene:PackedScene
@export var bullet_left_scene:PackedScene
@export var bullet_down_scene:PackedScene
@export var bullet_right_scene:PackedScene
var screen_size

var last_shot_time = 0
var BulletsNode

signal hit
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	last_shot_time = Time.get_ticks_msec()
	BulletsNode = $BulletsNode


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
#Animations
	if velocity.y < 0:
		$AnimatedSprite2D.animation = "Back"
	if velocity.y > 0:
		$AnimatedSprite2D.animation = "Default"
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * Global.speed

	#player clamp
		position += velocity * _delta
	position = position.clamp(Vector2.ZERO, screen_size)
	#bullets
	var current_time = Time.get_ticks_msec()
	if (current_time - last_shot_time > Global.weapon_cooldown()):
		if Input.is_action_pressed("Shoot U"):
			spawn_bullet_up()
			last_shot_time = current_time
		if Input.is_action_pressed("Shoot L"):
			spawn_bullet_left()
			last_shot_time = current_time
		if Input.is_action_pressed("Shoot D"):
			spawn_bullet_down()
			last_shot_time = current_time
		if Input.is_action_pressed("Shoot R"):
			spawn_bullet_right()
			last_shot_time = current_time

func spawn_bullet_up():
	var bullet = bullet_up_scene.instantiate()
	bullet.position = position
	BulletsNode.add_child(bullet)

func spawn_bullet_left():
	var bullet = bullet_left_scene.instantiate()
	bullet.position = position
	BulletsNode.add_child(bullet)

func spawn_bullet_down():
	var bullet = bullet_down_scene.instantiate()
	bullet.position = position
	BulletsNode.add_child(bullet)

func spawn_bullet_right():
	var bullet = bullet_right_scene.instantiate()
	bullet.position = position
	BulletsNode.add_child(bullet)

func _on_body_entered(_body):
	get_tree().change_scene_to_file.bind("res://game_over.tscn").call_deferred()
