extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("Ambil Coind")
	if body is PlayerController:
		# Ambil Coin
		GameManager.add_coin()
		
		queue_free() 
