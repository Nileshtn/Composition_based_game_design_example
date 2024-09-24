extends CharacterBody2D

var SPEED = 100
var JUMP_VELOCITY = -250
@export var player_stats:Control

@onready var platFormRay = $RayCast2D
@onready var animated_sprite = $AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D
@onready var health_component = $health_component
@onready var hit_area_component = $hit_area_component
@onready var attack_component = $attack_component
@onready var animation_player = $AnimationPlayer

var attack_direction = 1
var attack_type = "attack_right"


func _process(delta):
	#print(health_component.max_health)
	pass
	
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction < 0:
		animated_sprite.flip_h = true
		attack_direction = -1
		attack_type = "attack_left"
		hit_area_component.get_traget(attack_direction)
	elif direction > 0:
		animated_sprite.flip_h = false
		attack_direction = 1
		attack_type = "attack_right"
		hit_area_component.get_traget(attack_direction)
		
	if Input.is_action_just_pressed("attack"):
		animation_player.play(attack_type,-1,10)
		var target = hit_area_component.get_traget(attack_direction)
		if target:
			attack_component.deal_damage(target)
	
	if direction:
		if !is_on_floor():
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
		velocity.x = direction * SPEED
	else:
		animated_sprite.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_health_component_on_health_reduce():
	print("got hurt")
	animation_player.play("on_hurt")
	player_stats.set_health_bar()
	print("i played")


func _on_health_component_on_health_increase():
	player_stats.set_health_bar()
