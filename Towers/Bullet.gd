extends KinematicBody2D

var target
var speed = 512
var linear_velocity

func _ready():
	look_at(target.position)
	linear_velocity = Vector2(speed,0).rotated(rotation)

func _physics_process(delta):
	linear_velocity = move_and_slide(linear_velocity)


func _on_Area2D_body_entered(body):
	if body.is_in_group("Enemy"):
		body.health -= 3
		queue_free()


func _on_Timer_timeout():
	queue_free()
