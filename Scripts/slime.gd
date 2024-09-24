extends Node2D

const SPEED = 60
var direction = 1

@onready var rdown_rc = $rdownRC
@onready var rstright_rc = $rstrightRC
@onready var ldown_rc = $ldownRC2
@onready var lstright_rc = $lstrightRC2
@onready var animatedSprit = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer

@onready var health_component = $StaticBody2D/health_component
var is_alive:bool = true



func _process(delta):
	is_alive = health_component.check_alive()
	if !is_alive:
		animation_player.play("on_dead")
	
	if is_alive:
		if rstright_rc.is_colliding() or !rdown_rc.is_colliding():
			direction = -1
			animatedSprit.flip_h = true
			
		if lstright_rc.is_colliding() or !ldown_rc.is_colliding():
			direction = 1
			animatedSprit.flip_h = false
			
		position.x += SPEED * direction * delta
	
func play_dead():
	animatedSprit.play("dead")
