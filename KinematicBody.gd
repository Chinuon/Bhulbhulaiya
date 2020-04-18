extends KinematicBody
const SPEED = 10
var velocity = Vector3(0,0,0)  
var gravity = -20
var direction = Vector3()
var backtimer = 180
var milisec = 60

func _ready():
	set_physics_process(true)
	set_process(true)
	
func _process(delta):
	var labelnode = get_parent().get_node("KinematicBody/Camera/Label")
	labelnode.text = str(backtimer)
	milisec -= 1
	if milisec == 0:
		backtimer -= 1
		milisec = 60

func _physics_process(delta):
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = 0
	elif Input.is_action_pressed("ui_right"):
			velocity.x = SPEED
	elif Input.is_action_pressed("ui_left"):
			velocity.x = -SPEED
	else:
		velocity.x = lerp(velocity.x,0,0.1)
			
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
			velocity.z = -SPEED
	elif Input.is_action_pressed("ui_down"):
			velocity.z = SPEED
	else:
		velocity.z = lerp(velocity.z,0,0.1)
		
	if velocity.y > 0:
		gravity = -3
	else:
		gravity = -3
		velocity.y += gravity 
	move_and_slide(velocity, Vector3(0, 1, 0))

func _on_Timer_timeout():
	get_tree().change_scene("res://menu.tscn")
