extends Node2D

@export var selcected_units : Array[Node]
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

#func _unhandled_input(event):
		#elif  event.button_index == 2 && !event.pressed:
			#selcected_units = []
			#
			#if Input.is_action_pressed("multi-select"):
				#
				#pass
			#else:
				#
				#for body in selection_area.get_overlapping_bodies():
					#if body.is_in_group("units"):
						#selcected_units.append(body)
				#print(selcected_units)


func _unhandled_input(event):
	# detect left click release
	if event is InputEventMouseButton:
		if event.button_index == 2 && !event.pressed:
			if selcected_units != []:
				for unit in selcected_units:
					unit.updateTargetPosition(position)
				command_arrow.stop()
				command_arrow.play("default")
		# detect left click 
		elif event.button_index == 2 && event.pressed:
			position = get_global_mouse_position()
