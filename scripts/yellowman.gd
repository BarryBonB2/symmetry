extends CharacterBody2D
class_name Yellow

@onready var purpleman: CharacterBody2D = $"../Purpleman"

@export var move_speed: float = 400.0
@export var maxHealth : int = 1
@export var health : int = maxHealth
const GRAVITY = 2000.0
const JUMP_SPEED = 2000.0
var current_gravity : float=GRAVITY
var grav_lerp_factor: float= .75


func _physics_process(delta):
	var direction = Vector2.ZERO
	direction.x = Input.get_axis("ui_left", "ui_right")
	
	if direction.length() > 0:
		direction = direction.normalized()
	
	velocity = direction * move_speed
	
	velocity.y += delta * GRAVITY
	
	var motion = velocity * delta
	move_and_collide(Vector2(0, 1)) # Move down 1 pixel per physics frame
	if is_on_floor() and  Input.is_action_just_pressed("ui_up"):
		velocity.y -= JUMP_SPEED
	if not is_on_floor():
		current_gravity= lerp(current_gravity, GRAVITY,grav_lerp_factor)
		velocity.y += current_gravity * delta
	move_and_slide()
