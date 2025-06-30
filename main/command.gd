extends Node2D

var selcected_units = []
@onready var command_arrow = $"command arrow"

@export var selection_area : Area2D

@export var collision_shape : CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("deselect"):
		selcected_units = []

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 2 && event.pressed:
			global_position = get_global_mouse_position()
			if selcected_units != [] && !Input.is_action_pressed("multi_select"):
				for unit in selcected_units:
					unit.updateTargetPosition(position)
				command_arrow.stop()
				command_arrow.play("default")
		elif  event.button_index == 2 && !event.pressed:
			selcected_units = []
			
			if Input.is_action_pressed("multi-select"):
				
				pass
			else:
				
				for body in selection_area.get_overlapping_bodies():
					if body.is_in_group("units"):
						selcected_units.append(body)
				print(selcected_units)
