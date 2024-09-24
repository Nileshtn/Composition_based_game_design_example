extends Area2D

var heal_health =  20

func _on_body_entered(body):
	if body.has_node("health_component"):
		body.get_node("health_component").deal_heal(heal_health)
		
	queue_free()
