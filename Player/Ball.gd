extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var dyna_speed = 0.0;
func _physics_process(delta):
	# Add the gravity.
	dyna_speed += delta
	if not is_on_floor():
		velocity.y += gravity * delta - dyna_speed
	
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_released("ui_up") :
		dyna_speed = 0.0
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	_ratation_ball(direction,delta)
	move_and_slide()

func _ratation_ball(direction : float,delta : float) :
	if direction :
		rotate(direction * 0.2)
	else :
		rotate(direction * 0.2)
	pass
