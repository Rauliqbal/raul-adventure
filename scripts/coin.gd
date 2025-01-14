extends Area2D

@onready var coin_sfx = $"../../CoinSfx"

func _on_body_entered(body: Node2D) -> void:
	print("Ambil Coin")
	
	
	if body is PlayerController:
		# Ambil Coin
		coin_sfx.play()
		GameManager.add_coin()
		queue_free() 
