extends CharacterBody2D
class_name Yellow

@onready var purpleman: CharacterBody2D = $"../Purpleman"

@export var move_speed: float = 400.0
@export var maxHealth : int = 1
@export var health : int = maxHealth
const GRAVITY = 200.0


func _physics_process(delta):
	handle_movement()
	#velocity.y += delta * GRAVITY
	
	#var motion = velocity * delta
	#move_and_collide(Vector2(0, 1)) # Move down 1 pixel per physics frame

func handle_movement():
	# Get input direction from arrow keys
	var direction = Vector2.ZERO
	direction.x = Input.get_axis("ui_left", "ui_right")
	
	
	
	# Normalize diagonal movement to prevent speed boost
	if direction.length() > 0:
		direction = direction.normalized()
	
	# Apply movement using Godot's built-in physics
	velocity = direction * move_speed
	move_and_slide()
