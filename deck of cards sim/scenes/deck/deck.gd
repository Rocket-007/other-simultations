extends Control


var card = ""
var card_history = [""]

func _process(delta):
	if "deck" in get_parent():
		if get_parent().deck.size() < 1:
			$hidden_card.hide()
			
	if "drawn_card" in get_parent():
		if get_parent().drawn_card:
			card = get_parent().drawn_card
			
			for v in $clubs.get_children():
				v.hide()
			if $clubs.has_node(card):
				$clubs.get_node(card).show()
				
			for v in $clubs2.get_children():
				v.hide()
			if $clubs2.has_node(card_history[0]):
				$clubs2.get_node(card_history[0]).show()
				
		if "deck" in get_parent():
			if get_parent().deck:
				$Label.text = "Total Cards: " + str(get_parent().deck.size()) + "/" + str(52)
			else:
				$Label.text = "Total Cards: " + str(0) + "/" + str(52)


func _on_deck_gui_input(event):
	if event is InputEventMouseButton:
		print("yata")
		if event.is_pressed():
			if "deck" in get_parent():
				if get_parent().deck.size() >=1:
					$AnimationPlayer.stop()
					$AnimationPlayer.play("picked_animation")
					
					# throw the card if visible and not empty
					if $clubs.visible:
						$AnimationPlayer2.stop()
						$AnimationPlayer2.play("throw_card_1")
					
					if "deck" in get_parent():
						get_parent().run_once()
						card_history.push_front(card)
					
				else:
					$AnimationPlayer.stop()
					$AnimationPlayer.play("end_of_deck")
					

