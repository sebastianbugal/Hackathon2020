extends Node

onready var nav_2d : Navigation2D = $Navigation2D
onready var line_2d : Line2D = $Line2D
onready var enemy : RigidBody2D = $Starpew
onready var core : RigidBody2D = $Core
var wave_size = 5
onready var enem = preload("res://Enemies/Starpew/Starpew.tscn")
var timer

func _unhandled_input(event: InputEvent) -> void:
	if not event is InputEventMouseButton:
		return 
	if event.button_index != BUTTON_LEFT or not event.pressed:
		return
	var new_path : = nav_2d.get_simple_path(enemy.position, core.position)
	line_2d.points = new_path
	enemy.path = new_path
	
	

func _on_Core_body_entered(body):
	pass # Replace with function body.


func _on_WaveCounter_timeout():
	for i in range(wave_size):
		var cur = enem.instance()
		cur.position = Vector2(-650,-650)
		get_tree().current_scene.add_child(cur)
