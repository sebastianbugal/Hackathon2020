extends Node2D

onready var missile = preload("res://Missile.tscn")

var targets =[]

func _on_ThreatRange_body_entered(body):
	if body.is_in_group("Enemy"):
		if not targets.has(body):
			targets.append(body)

func _on_ThreatRange_body_exited(body):
	if targets.has(body):
		targets.remove(targets.find(body))
		pass

func _on_ShootTimer_timeout():
	if targets.size() > 0:
		var m = missile.instance()
		m.target = targets[0]
		add_child(m)
