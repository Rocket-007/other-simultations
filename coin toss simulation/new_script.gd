tool

extends EditorScript


func _ready():
	var num_tosses = 10
	var tosses = coin_toss(num_tosses)
	print(tosses)

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
	
func _run():
	print(coin_toss(10))
