extends Area2D

@onready var game_maneger = %gameManeger

func _on_body_entered(body):
	game_maneger.update_spawnpoint(self)
