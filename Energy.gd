extends Node2D


var CharingEnergy = false
func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		body.GettingEnergy = true
		print("Working Energy")

func _on_Area2D_body_exited(body):
		if body.is_in_group("Player"):
			body.GettingEnergy = false
			print("Working Energy Exit")	
