extends CharacterBody2D
class_name Yellow

@onready var purpleman: CharacterBody2D = $"../Purpleman"

@export var move_speed: float = 400.0
var gravity: float= 2000

func _physics_process(_delta):
	handle_movement()

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
