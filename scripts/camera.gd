extends CharacterBody2D

@onready var yellowman: Yellow = $Yellowman
@export var target = 0
@export var move_speed: float = 400.0


func _physics_process(delta):
	var direction = Vector2.ZERO
	direction.x = Input.get_axis("ui_left", "ui_right")
	
	if direction.length() > 0:
		direction = direction.normalized()
	
	velocity = direction * move_speed

	move_and_slide()
