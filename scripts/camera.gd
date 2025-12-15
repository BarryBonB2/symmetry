extends Node2D

@onready var yellowman: Yellow = $Yellowman
@export var target = 0



	
	

	
func movement (delta):
	target = yellowman.position.x
	
