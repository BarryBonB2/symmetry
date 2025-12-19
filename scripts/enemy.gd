extends CharacterBody2D


@export var health : int = 10
@export var speed : int = 75
@export var move_points : Array[Vector2] = []
@export var move_point : int = 0
@export var target : Vector2 


func _physics_process(delta: float) -> void:
	movement()
	move_and_slide()
	
	
func movement():
	target = move_points[move_point]
	var target_direction = position.direction_to(target)
	velocity = speed * target_direction
	if position.distance_to(target)<10:
		move_point+=1
		if move_point > move_points.size()-1:
			move_point = 0
	
