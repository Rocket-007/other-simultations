extends KinematicBody2D


var velocity = Vector2.ZERO
var gravity = 1400

var full = true


func _physics_process(delta):
	move(delta)
	pass


func move(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	move_and_slide(Vector2(velocity), Vector2.UP, false, 4, PI/4, false)
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.is_in_group("convey_belt"):
			velocity.x -= collision.collider.temp_speed * delta
			if collision.collider.temp_speed == 0:
				velocity.x = 0
		if collision.collider.is_in_group("box"):
			collision.collider.add_amount(1)
			get_parent().tomatoes += 1
			if collision.collider.full:
				get_parent().get_node("spawner2").spawn()
				get_parent().boxes += 1
			queue_free()
			break
