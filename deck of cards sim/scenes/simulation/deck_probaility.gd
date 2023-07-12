extends VBoxContainer



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if "deck" in get_parent():
		if "probabilities" in get_parent():
			var probabilities = get_parent().probabilities
			if probabilities:
				for item in probabilities.keys():
					if has_node(item):
						get_node(item).get_node("Label").text = "Probability: " + str(probabilities[item])
						get_node(item).get_node("Label2").text = "Amount left: " + str(get_parent().deck.count(item)) + "/"+ str(4)
					
	# remover probability informations for empty ranks
	for v in get_children():
		if not v.name in get_parent().deck:
			v.queue_free()
