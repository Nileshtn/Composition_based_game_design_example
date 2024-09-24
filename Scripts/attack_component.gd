extends Node2D

@export var damage: int
@export var attack_radius: int

func deal_damage(traget:Node):
	if traget.has_node("health_component"):
		traget.get_node("health_component").take_damage(damage)
