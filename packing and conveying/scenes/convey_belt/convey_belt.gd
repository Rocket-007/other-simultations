extends KinematicBody2D

var speed = 60#40
var temp_speed = speed


func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	move_and_stop(delta)
	
	
func move_and_stop(delta):
	for body in $Area2D_left.get_overlapping_bodies():
		if body.is_in_group("container"):
			if body.full == true:
				print("container  is full")
				temp_speed = speed
			else:
				temp_speed = 0
				
	for body in $Area2D_right.get_overlapping_bodies():
		if body.is_in_group("box"):
			if body.full == true:
				temp_speed = speed
			else:
				temp_speed = 0
