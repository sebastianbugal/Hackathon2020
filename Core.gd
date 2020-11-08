extends Node2D

var health =1000
func _physics_process(delta):
	pass
	
func _on_Core_body_entered(body):
	print("entered")
	if body.is_in_group("Enemy"):
		health-=20
		print(health)
