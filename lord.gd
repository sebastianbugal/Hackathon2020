extends KinematicBody2D

var run_speed = 60
var jump_strength = 360
var gravity = 10

var velocity = Vector2(0,0)

func _physics_process(_delta):
	#HORIZONTAL MOVEMENT
	if Input.is_action_pressed("ui_right"):
		velocity.x += run_speed
	if Input.is_action_pressed("ui_left"):
		velocity.x -= run_speed
	#FRICTION
	velocity.x /= 1.2

	#JUMPING remove the "just" if you want to hold to jump
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = -jump_strength
	#JUMP CUTOFF
	if Input.is_action_just_released("ui_up") and velocity.y < 0:
		velocity.y /= 2
	
	#GRAVITY
	velocity.y += gravity
	
	velocity = move_and_slide(velocity, Vector2.UP)
