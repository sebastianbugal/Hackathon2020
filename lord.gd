extends RigidBody2D
var Energy = 0
var GettingEnergy= false
func _physics_process(delta):
	if Input.is_action_pressed("right"):
		apply_torque_impulse(50)
	if Input.is_action_pressed("left"):
		apply_torque_impulse(-50)
	if Input.is_action_pressed("forward"):
		apply_central_impulse(Vector2(0,5).rotated(rotation))
	if Input.is_action_pressed("backward"):
		apply_central_impulse(Vector2(0,-5).rotated(rotation))
	if GettingEnergy:
		Energy+=.01
