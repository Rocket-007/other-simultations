extends Control


var coin_display_image = load("res://coin toss simulation/scenes/coin_display_image.tscn")
var coin_display = load("res://coin toss simulation/scenes/coinDisplay.tscn")


func _ready():
	$touch.connect("gui_input", self, "input2")


func coin_toss(num_tosses: int) -> Array:
	var outcomes = ['H', 'T']
	var result = []

	for i in range(num_tosses):
		var next_outcome = random_choice(outcomes)
		result.append(next_outcome)

	return result


func random_choice(items: Array) -> int:
	var random_index = randi() % items.size()
	return items[random_index]


func input2(event):
	print("yess")
	if event is InputEventMouseButton and event.pressed:
		var o = coin_toss(1)

		var coin_display_image_instance = coin_display_image.instance()
		coin_display_image_instance.value = o[0]

		if get_child(get_child_count()-1).get_node("HBoxContainer").get_child_count() > 16:
			var coin_display_instance = coin_display.instance()
			coin_display_instance.position = get_child(get_child_count()-1).position + Vector2(0,90)
			add_child(coin_display_instance)

		var _last_coin_display = get_child(get_child_count()-1)
		_last_coin_display.get_node("HBoxContainer").add_child(coin_display_image_instance)

		$coin_toss.value = o[0]
		$coin_toss.coin_toss()


func _input(event):
	if Input.is_key_pressed(KEY_R):
		get_tree().reload_current_scene()


func _on_back_pressed():
	get_tree().change_scene("res://Main Menu.tscn")
