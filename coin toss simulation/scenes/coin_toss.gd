extends Node2D



export var value = "T"

func _ready():
	if value == "H":
		$CoinNew_head.show()
		$CoinNew_tail.hide()
		$Label.text = "HEAD"
	else:
		$CoinNew_head.hide()
		$CoinNew_tail.show()
		$Label.text = "TAIL"

func coin_toss():
	$AnimationPlayer.stop()
	$AnimationPlayer2.stop()
	$AnimationPlayer.play("toss")
	$AnimationPlayer2.play("toss")

	if value == "H":
		$CoinNew_head.show()
		$CoinNew_tail.hide()
	else:
		$CoinNew_head.hide()
		$CoinNew_tail.show()

func _process(delta):
		if value == "H":
			$CoinNew_head.show()
			$CoinNew_tail.hide()
			$Label.text = "HEAD"
		else:
			$CoinNew_head.hide()
			$CoinNew_tail.show()
			$Label.text = "TAIL"
