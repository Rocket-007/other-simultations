tool

extends EditorScript




var deck = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", 
			"Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", 
			"Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", 
			"Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]
#var deck = [["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"], 
#			["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"], 
#			["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"], 
#			["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]]

func draw_card() -> String:
	var card = deck[randi() % deck.size()]
	deck.erase(card)
	return card


func calculate_probabilities2():
	var total_cards = deck.size()
	var probabilities = {}
	
	for card in deck:
		var card_count = deck.count(card)
#		var suit = card.split(" ")[-1]
#		var rank = card.split(" ")[0]
		probabilities[card] = float(card_count) / float(total_cards)
	
	return probabilities


func _run():
	# Example usage
	for i in range(51):
		var drawn_card = draw_card()
		print("--------------------------")
		print("Drawn card:", drawn_card)
		print("cards left:", deck.size())
		
		var probabilities = calculate_probabilities2()
		print("\n--Probabilities:--")
		for item in probabilities.keys():
			print(item, ":", probabilities[item])
	
