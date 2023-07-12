extends KinematicBody2D


var velocity = Vector2.ZERO
var gravity = 1400

var full_amount = 0
var full_amount_max = 5
var full = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move(delta)
	$Label.text = str(full_amount) + "/" + str(full_amount_max)
	pass

func move(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider:
			if collision.collider.is_in_group("convey_belt"):
				velocity.x += collision.collider.temp_speed * delta
				if collision.collider.temp_speed == 0:
					velocity.x = 0
		#			break
#	    	


	move_and_slide(Vector2(velocity), Vector2.UP, false, 4, PI/4, false)


func add_amount(num):
	full_amount += num
	if full_amount == full_amount_max:
		full = true
