extends RigidBody2D

var target
var thrust = 2

func _physics_process(delta):
	look_at (target.transform.origin)
	apply_central_impulse(Vector2(thrust,0).rotated(rotation))


func _on_Missile_body_entered(body):
	if body.is_in_group("Enemy"):
		body.health -= 25
		queue_free()
