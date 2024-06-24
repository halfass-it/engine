extends Node2D

# Variables to track touch state
var touch_start_position: Vector2 = Vector2.ZERO
var camera_start_position: Vector2 = Vector2.ZERO

# Bounds
const MIN_X = 0
const MIN_Y = 0
const MAX_X = 5000
const MAX_Y = 3500

func _ready():
	# Ensure the node is in the top layer and receives input
	set_process_input(true)

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			# On touch start, record the touch position and camera position
			touch_start_position = event.position
			camera_start_position = position
		else:
			# On touch release, do nothing
			pass
	elif event is InputEventScreenDrag:
		# On touch drag, calculate the new position
		var drag_offset = event.position - touch_start_position
		var new_position = camera_start_position + drag_offset
		# Apply the new position
		position = new_position

func _on_back_btn_released():
	get_tree().change_scene_to_file("res://Research.tscn")
