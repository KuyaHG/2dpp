extends RigidBody2D
@export var player_3_scene:PackedScene
var player
var boss_wave
var main_scene

var hp

const BOSS_SPEED = 200
var dir = Vector2(0,0)

func _ready():
	hp = 5
	pass

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

	#if hiddenposition:
		#state.transform = Transform2D(0.0, Vector2(-1000, -1000))
	#else:
		##state.transform = Transform2D(0.0, Vector2(400, 90))
		#pass

func follow_player(player_to_follow):
	player = player_to_follow

func set_main_scene(scene):
	main_scene = scene


func take_damage():
	#print ("I am boss and I die")
	
	hp -= 1
	
	if hp <= 0:
		print ("Boss is killed!")
		if main_scene != null:
			main_scene.boss_died()
		
		queue_free()
	else:
		print ("Boss is hurt!")

