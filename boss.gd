extends RigidBody2D
@export var player_3_scene:PackedScene
var player
var main_scene
var hp
const BOSS_SPEED = 200
var dir = Vector2(0,0)

func _ready():
	hp = 10
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player != null:
		var player_difference = player.position - position
		dir = player_difference.normalized() * BOSS_SPEED
	

func _integrate_forces(state):
	state.apply_force(dir)

func follow_player(player_to_follow):
	player = player_to_follow

func set_main_scene(scene):
	main_scene = scene

func take_damage(damage):
	#print ("I am boss and I die")
	
	hp -= damage
	
	if hp <= 0:
		print ("Boss is killed!")
		Global.boss_died()
		call_deferred('free')
	else:
		print ("Boss is hurt!")

