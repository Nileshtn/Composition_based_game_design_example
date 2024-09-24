extends Node2D

signal on_health_reduce
signal on_health_increase

@export var max_health:int
var current_health:int

func _ready():
	current_health = max_health
	
func check_alive():
	if current_health <= 0:
		return false
	return true

func take_damage(damage:int):
	current_health -= damage
	on_health_reduce.emit()
	print(current_health)
	
func deal_heal(health:int):
	current_health += health
	if current_health > max_health:
		current_health = max_health
	
	on_health_increase.emit()
