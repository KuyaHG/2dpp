extends Area2D

const BULLET_SPEED = 700
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(0, -BULLET_SPEED) * delta
	
	if position.x < 0 or position.y < 0 or position.x > screen_size.x or position.y > screen_size.y:
		queue_free()

func _on_body_entered(body):
	body.take_damage()
	queue_free()
	
