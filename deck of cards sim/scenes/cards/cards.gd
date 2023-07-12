extends Control


export var card = "Ace"


# Called when the node enters the scene tree for the first time.
func _ready():
	for v in $clubs.get_children():
		v.hide()
	
	if $clubs.has_node(card):
		$clubs.get_node(card).show()
