extends Node2D

onready var bullet = preload("res://Towers/Bullet.tscn")

var targets =[]

func _ready():
	connect("killed", self, "enemy_killed")
	
	
func _on_Threat_body_entered(body):
	if body.is_in_group("Enemy"):
		if not targets.has(body):
			targets.append(body)


func _on_Threat_body_exited(body):
	if targets.has(body):
		targets.remove(targets.find(body))
		pass

func _on_Timer_timeout():
	if targets.size() > 0:
		var b = bullet.instance()
		b.target = targets[0]
		add_child(b)

func enemy_killed(enemy):
	if targets.has(enemy):
		targets.remove(targets.find(enemy))
