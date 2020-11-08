extends Node2D

var health = 50

func _physics_process(delta):
	if health < 0:
		get_tree().change_scene("res://GameOver.tscn")
		#pass
