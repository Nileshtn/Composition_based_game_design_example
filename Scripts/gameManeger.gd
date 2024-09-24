extends Node

@onready var player_stats = %playerStats

var current_payer_spawn:Area2D
	
func update_spawnpoint(spawnpoint:Area2D):
	current_payer_spawn = spawnpoint
	
func on_fall_death():
	player_stats.reset_player_stats(true, false)
	
	
