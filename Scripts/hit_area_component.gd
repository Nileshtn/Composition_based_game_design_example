extends Area2D

@export var health_component:Node2D
@export var attack_component:Node
@export var masterNode:Node
@export var is_player:bool = false
@onready var ray_cast = $RayCast2D


func _ready():
	if is_player:
		ray_cast.enabled = true
		ray_cast.target_position = Vector2(attack_component.attack_radius, 0)
		ray_cast.set_collision_mask_value(3, true)
		ray_cast.set_collision_mask_value(1, false)

func _on_body_entered(body):
	if !is_player:
		if is_instance_valid(attack_component):
			attack_component.deal_damage(body)
			return

func get_traget(direction):
	if direction > 0:
		direction = 1
	elif direction < 0:
		direction = -1
	ray_cast.target_position = Vector2(attack_component.attack_radius * direction, 0)
	if ray_cast.is_colliding():
		return ray_cast.get_collider()
	return null
