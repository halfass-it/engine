extends Node2D

# Variables to track touch state
var touch_start_position: Vector2
var camera_start_position: Vector2

# Bounds
const MIN_X = 0
const MIN_Y = 0
const MAX_X = 5000
const MAX_Y = 3500

func _ready():
	# Ensure the node is in the top layer and receives input
	set_process_input(true)
	var viewport_size = get_viewport_rect().size
	print(viewport_size)

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			# On touch start, record the touch position and camera position
			touch_start_position = event.position
			camera_start_position = position
	elif event is InputEventScreenDrag:
		# Calculate drag offset
		var drag_offset = event.position - touch_start_position
		
		# Calculate new position
		var new_position = camera_start_position + drag_offset
		
		# Clamp new position within bounds considering viewport size
		var viewport_size = get_viewport_rect().size
		var max_position = Vector2(MAX_X - viewport_size.x, MAX_Y - viewport_size.y)
		new_position.x = clamp(new_position.x, -max_position.x, 0)
		new_position.y = clamp(new_position.y, -max_position.y, 0)
		
		# Apply the new position
		position = new_position


func _on_back_btn_released():
	get_tree().change_scene_to_file("res://Research.tscn")
