extends Area2D

func _on_body_entered(body):
	print("coin collected!")
	if body.has_node("player_stats"):
		body.get_node("player_stats").add_coin_count(1)
	queue_free()
