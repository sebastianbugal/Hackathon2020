extends RigidBody2D
var Energy = 0
var max_energy = 100
var GettingEnergy= false
onready var tower = preload("res://Towers/BasicLauncher.tscn")
func _physics_process(delta):
	if Input.is_action_pressed("right"):
		apply_torque_impulse(50)
	if Input.is_action_pressed("left"):
		apply_torque_impulse(-50)
	if Input.is_action_pressed("forward"):
		apply_central_impulse(Vector2(0,5).rotated(rotation))
	if Input.is_action_pressed("backward"):
		apply_central_impulse(Vector2(0,-5).rotated(rotation))
	if GettingEnergy and Energy < max_energy:
		Energy+=.01
	if Input.is_action_just_pressed("DropTower") and Energy >= 10:
		var cur = tower.instance()
		cur.position = position
		get_tree().current_scene.add_child(cur)
		Energy -= 10
	$Particles2D.amount = Energy/2


func _on_Timer_timeout():
	$Particles2D.restart
