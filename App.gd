extends Node

onready var nav_2d : Navigation2D = $Navigation2D
onready var line_2d : Line2D = $Line2D

onready var core : RigidBody2D = $Core
var wave_size = 5
onready var enem = preload("res://Enemies/Starpew/Starpew.tscn")
var timer

func _on_Core_body_entered(body):
	pass # Replace with function body.

func _on_WaveCounter_timeout():
	for i in range(wave_size):
		var side = i%4
		var cur
		if(side == 0):
			cur = enem.instance()
			cur.position = Vector2(-650,-650)
		elif side == 1:
			cur = enem.instance()
			cur.position = Vector2(650,650)
		elif side == 2:
			cur = enem.instance()
			cur.position = Vector2(-650,650)
		elif side == 3:
			cur = enem.instance()
			cur.position = Vector2(650,-650)
		get_tree().current_scene.add_child(cur)
		var new_path : = nav_2d.get_simple_path(cur.position, core.position)
		cur.path = new_path
	wave_size+=3
	
