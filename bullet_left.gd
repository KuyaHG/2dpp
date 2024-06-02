extends Area2D

var screen_size
var damage
var piercing
var speed

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size	
	damage = Global.weapon_damage()
	piercing = Global.is_weapon_piercing()
	speed = Global.weapon_speed()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(-speed, 0) * delta
	
	if position.x < 0 or position.y < 0 or position.x > screen_size.x or position.y > screen_size.y:
		queue_free()


func _on_body_entered(body):
	body.take_damage(damage)
	if !piercing:
		queue_free()
