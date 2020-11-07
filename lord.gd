extends RigidBody2D

var run_speed = 60
var jump_strength = 360
var gravity = 10


var velocity = Vector2(0,0)

func _physics_process(_delta):
	#HORIZONTAL MOVEMENT
	if Input.is_action_pressed("ui_right"):
		add_torque(.5)
	if Input.is_action_pressed("ui_left"):
		add_torque(.5)
	#FRICTION
	velocity.x /= 1.2
	velocity.y /= 1.2

	#JUMPING remove the "just" if you want to hold to jump
	if Input.is_action_pressed("ui_up"):
		velocity.y += run_speed
	if Input.is_action_pressed("ui_down"):
		velocity.y -= run_speed
	
	#GRAVITY

