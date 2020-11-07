extends RigidBody2D

signal killed

var health = 50

func _physics_process(delta):
	if health <= 0:
		emit_signal("killed", self)
		queue_free()
