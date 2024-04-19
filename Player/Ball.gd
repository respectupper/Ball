extends CharacterBody2D

@onready var model : Sprite2D = $Model

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var dyna_speed = 0.0;

var dis_move : bool = false
func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_released("ui_up") :
		dyna_speed = 0.0
		
	if dis_move : return
	if Input.is_action_pressed("ui_up") :
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			velocity.y -= dyna_speed
			dyna_speed = wrap(dyna_speed + 50,0,350)
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	_ratation_ball(direction)
	move_and_slide()

func _ratation_ball(direction : float) :
	if direction :
		model.rotate(direction * 0.2)
	else :
		model.rotate(direction * 0.2)
	pass

var is_big : bool = false
func _change_size():
	if is_big :
		var tween = create_tween()
		tween.bind_node(self)
		#tween.tween_property()
		pass
	pass
