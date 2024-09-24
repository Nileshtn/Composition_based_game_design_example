extends Area2D
@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	print("coin collected!")
	if body.has_node("player_stats"):
		body.get_node("player_stats").add_coin_count(1)
	
	animation_player.play("on_coin_collected")
	
