extends Control

@export var player:CharacterBody2D

@onready var coin = $coin
@onready var healthbar = $healthbar


@onready var player_health = player.get_node("health_component")
var collected_coin:int = 0

func _ready():
	healthbar.max_value = player_health.max_health
	healthbar.value = player_health.current_health
	coin.text = str(collected_coin)
	
func add_coin_count(coin_count:int):
	collected_coin += coin_count
	coin.text = str(collected_coin)
#
func set_health_bar():
	healthbar.value = player_health.current_health

func reset_player_stats(rhealth:bool, rcoin:bool):
	if rhealth:
		healthbar.value = player_health.max_health
	if rcoin:
		collected_coin = 0
		coin.text = str(collected_coin)
		
