extends Control



var deck = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", 
			"Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", 
			"Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", 
			"Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]


var probabilities

var drawn_card

func draw_card() -> String:
	var card = deck[randi() % deck.size()]
	deck.erase(card)
	return card


func calculate_probabilities():
	var total_cards = deck.size()
	var probabilities = {}
	
	for card in deck:
		var card_count = deck.count(card)
#		var suit = card.split(" ")[-1]
#		var rank = card.split(" ")[0]
		probabilities[card] = float(card_count) / float(total_cards)
	
	return probabilities


func run_once():
	if deck.size() <= 0:
		return
		
	drawn_card = draw_card()
	print("--------------------------")
	print("Drawn card:", drawn_card)
	print("cards left:", deck.size())
	
	probabilities = calculate_probabilities()
	print("\n--Probabilities:--")
	for item in probabilities.keys():
		print(item, ":", probabilities[item])
	

func _ready():
	probabilities = calculate_probabilities()


func _input(event):
	if Input.is_key_pressed(KEY_R):
		get_tree().reload_current_scene()


func _on_back_pressed():
	get_tree().change_scene("res://Main Menu.tscn")
