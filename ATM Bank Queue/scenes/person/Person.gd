extends KinematicBody2D


var velocity = Vector2.ZERO
var speed = 200

var complete_transaction = false
var on_atm = false
var has_exec = false


func show_random_sprite():
	# Hide all the random sprites first
	for v in $random_sprite.get_children():
		v.hide()
		# Select a random sprite from the node 2d
	var randomIndex = randi() % $random_sprite.get_child_count()
	var selectedSprite = $random_sprite.get_child(randomIndex)
	# Show the selected sprite
	selectedSprite.show()


func _ready():
	show_random_sprite()


func _physics_process(delta):
	do_transaction()
	move(delta)
	pass

func do_transaction():
	if on_atm and not complete_transaction and not has_exec:
		$AnimationPlayer.play("on_atm")
		$on_atm_timer.start()
		has_exec = true
		get_parent().get_node("ATM machine").customers_serviced += 1

func move(delta):
	if not is_on_floor():
		velocity.y += 1400 * delta
		
	move_and_slide(Vector2(velocity), Vector2.UP, false, 4, PI/4, false)
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.is_in_group("queue"):
			velocity.x -= speed * delta


func _on_on_atm_timer_timeout():
	complete_transaction = true
	get_parent().get_node("spawner").spawn()
