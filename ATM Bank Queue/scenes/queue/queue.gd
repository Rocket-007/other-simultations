extends KinematicBody2D



func _physics_process(delta):
	move(delta)
	pass


func move(delta):
	for body in $Area2D_left.get_overlapping_bodies():
		if body.is_in_group("Person"):
			if not body.complete_transaction == true:
				body.on_atm = true
				body.velocity.x = 0
