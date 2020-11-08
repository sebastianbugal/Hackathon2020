extends RigidBody2D

onready var exploision = preload("res://Explosion.tscn")

signal killed

export var speed = 20
export var health = 50
var path : = PoolVector2Array() setget set_path

func _ready() -> void:
	set_process(false)
	
func _physics_process(delta):
	move_along_path()
	if health <= 0:
		emit_signal("killed", self)
		var e = exploision.instance()
		e.transform = transform
		get_tree().current_scene.add_child(e)
		queue_free()


func move_along_path() -> void:
	var start_point : = position
	for i in range(path.size()):
		var distance_to_next : = start_point.distance_to(path[0])
		if 20<= distance_to_next:
			look_at(path[0])
			apply_central_impulse(Vector2(speed,0).rotated(rotation))
			# position = start_point.linear_interpolate(path[0], distance/distance_to_next)
			break
		start_point = path[0]
		path.remove(0)

	
func set_path(value : PoolVector2Array) -> void:
	path = value
	if value.size() == 0:
		return
	set_process(true)

