extends CharacterBody2D


const SPEED = 300.0

@export var wanted_loc : Node2D


func _physics_process(delta):
	
	velocity += (wanted_loc.global_position - position) * delta
	
	move_and_slide()
