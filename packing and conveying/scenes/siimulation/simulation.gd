extends Node2D


var tomatoes = 0
var boxes = 0



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	slow_fast_time()
	update_gui()


func update_gui():
	$GUI/Label.text = "Total Tomatoes Packed: " + str(tomatoes)
	$GUI/Label2.text = "Total Boxes Packed: " + str(boxes)
	

func slow_fast_time():
	if Input.is_key_pressed(KEY_1):
		Engine.time_scale -= 0.1
	elif Input.is_key_pressed(KEY_2):
		Engine.time_scale += 0.1


func _input(event):
	if Input.is_key_pressed(KEY_R):
		Engine.time_scale = 1
		get_tree().reload_current_scene()


func _on_back_pressed():
	get_tree().change_scene("res://Main Menu.tscn")
