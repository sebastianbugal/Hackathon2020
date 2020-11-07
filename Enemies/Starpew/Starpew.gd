extends RigidBody2D

onready var exploision = preload("res://Explosion.tscn")

signal killed

var health = 50

func _physics_process(delta):
	if health <= 0:
		emit_signal("killed", self)
		var e = exploision.instance()
		e.transform = transform
		get_tree().current_scene.add_child(e)
		queue_free()
