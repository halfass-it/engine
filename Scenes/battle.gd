extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var texture = $SubViewport.get_texture()
	var texture2 = $SubViewport2.get_texture()
	$Sprite2D2.texture = texture
	$Sprite2D3.texture = texture2
