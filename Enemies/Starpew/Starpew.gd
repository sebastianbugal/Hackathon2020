extends RigidBody2D

onready var exploision = preload("res://Explosion.tscn")

signal killed

var health = 50
var path : = PoolVector2Array() setget set_path

func _ready() -> void:
	set_process(false)
	
func _process(delta: float) -> void:
	var move_distance : = 400*delta
	move_along_path(move_distance)

func move_along_path(distance : float) -> void:
	var start_point : = position
	for i in range(path.size()):
		var distance_to_next : = start_point.distance_to(path[0])
		if distance <= distance_to_next and distance >= 0.0:
			position = start_point.linear_interpolate(path[0], distance/distance_to_next)
			break
		elif distance < 0.0:
			position = path[0]
			set_process(false)
			break
		distance -= distance_to_next
		start_point = path[0]
		path.remove(0)

func set_path(value : PoolVector2Array) -> void:
	path = value
	if value.size() == 0:
		return
	set_process(true)

func _physics_process(delta):
	if health <= 0:
		emit_signal("killed", self)
		var e = exploision.instance()
		e.transform = transform
		get_tree().current_scene.add_child(e)
		queue_free()
