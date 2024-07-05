extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_station_btn_released():
	get_tree().change_scene_to_file("res://spacestation.tscn")


func _on_research_btn_released():
	get_tree().change_scene_to_file("res://Research.tscn")


func _on_fleet_btn_released():
	get_tree().change_scene_to_file("res://Fleet.tscn")


func _on_shop_btn_released():
	get_tree().change_scene_to_file("res://Shop.tscn")
