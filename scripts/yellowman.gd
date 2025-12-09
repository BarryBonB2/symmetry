extends CharacterBody2D
class_name Yellow

@onready var purpleman: CharacterBody2D = $"../Purpleman"

@export var move_speed: float = 400.0
@export var maxHealth : int = 1
@export var health : int = maxHealth
const GRAVITY = 200.0
const JUMP_SPEED = 200.0

func _physics_process(delta):
	var direction = Vector2.ZERO
	direction.x = Input.get_axis("ui_left", "ui_right")
	
	if direction.length() > 0:
		direction = direction.normalized()
	
	velocity = direction * move_speed
	move_and_slide()


	velocity.y += delta * GRAVITY
	
	var motion = velocity * delta
	move_and_collide(Vector2(0, 1)) # Move down 1 pixel per physics frame
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = -JUMP_SPEED
