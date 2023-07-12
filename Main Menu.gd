extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Packing_and_conveying_pressed():
	get_tree().change_scene("res://packing and conveying/scenes/siimulation/simulation.tscn")


func _on_deck_of_cards_pressed():
	get_tree().change_scene("res://deck of cards sim/scenes/simulation/Simulation.tscn")

func _on_atm_queue_pressed():
	get_tree().change_scene("res://ATM Bank Queue/scenes/simulation/simulation.tscn")

func _on_coin_toss_pressed():
	get_tree().change_scene("res://coin toss simulation/scenes/simulation.tscn")
