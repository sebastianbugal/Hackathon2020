extends RigidBody2D

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		apply_torque_impulse(100)
	if Input.is_action_pressed("left"):
		apply_torque_impulse(-100)
