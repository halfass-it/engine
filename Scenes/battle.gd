extends Node2D
var max_health1 = 100
var max_health2 = 100
var health1 = max_health1
var health2 = max_health2


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	$Healthbar1.max_value = max_health1
	$Healthbar2.max_value = max_health2
	set_health_label($Healthbar1/Healthbar1Label,health1)
	set_health_label($Healthbar2/Healthbar2Label,health2)
	set_health_bar($Healthbar1,health1)
	set_health_bar($Healthbar2,health2)

func set_health_label(label,health):
	label.text = "Health: %s" % health
	
func set_health_bar(bar,health):
	bar.value = health

func damage(bar,label,health):
	health-=1
	print(health1)
	set_health_bar(bar,health)
	set_health_label(label,health)
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _input(event: InputEvent):
	if event.is_action_pressed("ui_accept"):
		damage($Healthbar1,$Healthbar1/Healthbar1Label,health1)
		
		
func _process(delta):
	var texture = $SubViewport.get_texture()
	var texture2 = $SubViewport2.get_texture()
	$Sprite2D2.texture = texture
	$Sprite2D3.texture = texture2


func _on_touch_screen_button_pressed():
	damage($Healthbar1,$Healthbar1/Healthbar1Label,health1)
