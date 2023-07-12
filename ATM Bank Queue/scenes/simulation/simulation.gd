extends Node2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_gui()
	slow_fast_time()


func update_gui():
	$"ATM machine/Label".text = "Customers Serviced: " + str($"ATM machine".customers_serviced)
	

func slow_fast_time():
	if Input.is_key_pressed(KEY_1):
		Engine.time_scale -= 0.1
	elif Input.is_key_pressed(KEY_2):
		Engine.time_scale += 0.1



func _input(event):
	if Input.is_key_pressed(KEY_R):
		Engine.time_scale = 1
		get_tree().reload_current_scene()
	
	if Input.is_action_just_pressed("spawn"):
		get_node("spawner").spawn()


func _on_back_pressed():
	get_tree().change_scene("res://Main Menu.tscn")
