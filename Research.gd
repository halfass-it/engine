extends Node2D
var is_dragging: bool = false
var drag_offset: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	
	
# This function processes input events
func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			# Finger touched the screen, start dragging
			is_dragging = true
			drag_offset = event.position - global_position
		else:
			# Finger released, stop dragging
			is_dragging = false
	elif event is InputEventScreenDrag and is_dragging:
		# Finger is moving and dragging is active
		global_position = event.position - drag_offset

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_dragging:
		# Update position while dragging
		var touch_pos = get_viewport().get_mouse_position()
		global_position = touch_pos - drag_offset



func _on_back_btn_released():
	get_tree().change_scene_to_file("res://main.tscn")
