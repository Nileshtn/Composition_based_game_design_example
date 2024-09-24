extends Node2D

@onready var game_maneger = %gameManeger
@onready var player = $Player
@onready var timer = $world/deadZone/Timer


func start_timer():
	timer.start()

func _on_timer_timeout():
	game_maneger.on_fall_death()
	player.position = game_maneger.current_payer_spawn.global_transform.origin

func _on_dead_zone_body_entered(body):
	start_timer()
