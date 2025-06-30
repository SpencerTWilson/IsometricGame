extends CharacterBody2D

@onready var agent = $NavigationAgent2D
var SPEED = 250
var targ : Vector2
@onready var command_arrow = $"command arrow"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process (delta):
	targ = agent.target_position
	
	if position.distance_to(targ) > 8.5:
		var curLoc = global_position
		var nextLoc = agent.get_next_path_position()
		velocity = (nextLoc - curLoc).normalized() * SPEED
		move_and_slide()

func updateTargetPosition(target):
	agent.set_target_position(target)
