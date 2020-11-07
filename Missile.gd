extends RigidBody2D

var target
var thrust = 10

func _physics_process(delta):
	look_at (target.transform.origin)
	apply_central_impulse(Vector2(thrust,0).rotated(rotation))
