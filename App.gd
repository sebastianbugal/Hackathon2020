extends Node

onready var nav_2d : Navigation2D = $Navigation2D
onready var line_2d : Line2D = $Line2D
onready var enemy : RigidBody2D = $Starpew
onready var lord : RigidBody2D = $lord

func _unhandled_input(event: InputEvent) -> void:
	if not event is InputEventMouseButton:
		return 
	if event.button_index != BUTTON_LEFT or not event.pressed:
		return
	var new_path : = nav_2d.get_simple_path(enemy.position, event.global_position - Vector2(1920/2,1080/2))
	line_2d.points = new_path
	enemy.path = new_path
