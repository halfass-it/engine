extends Node2D

var max_health1 = 100
var max_health2 = 100
	
var health1 = max_health1
var health2 = max_health2


func _ready():
	set_process_input(true)
	
	$Healthbar1.max_value = max_health1
	$Healthbar2.max_value = max_health2
	
	set_health_label($Healthbar1/Healthbar1Label,health1)
	set_health_label($Healthbar2/Healthbar2Label,health2)
	
	set_health_bar($Healthbar1,health1)
	set_health_bar($Healthbar2,health2)


func _input(event: InputEvent):
	if event.is_action_pressed("ui_accept"):
		health1 = damage(health1)
		set_health_bar($Healthbar1,health1)
		set_health_label($Healthbar1/Healthbar1Label,health1)
			
			
func _process(delta):
	var texture = $SubViewport.get_texture()
	var texture2 = $SubViewport2.get_texture()
	
	$Sprite2D2.texture = texture
	$Sprite2D3.texture = texture2


func _on_touch_screen_button_pressed():
	health1 = damage(health1)
	set_health_bar($Healthbar1,health1)
	set_health_label($Healthbar1/Healthbar1Label,health1)
	
	
func set_health_label(label,health):
	label.text = "Health: %s" % health
	
	
func set_health_bar(bar,health):
	bar.value = health


func damage(health):
	var _health = health - 1
	return _health
