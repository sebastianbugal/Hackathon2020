extends RigidBody2D
var Energy = 0
var GettingEnergy= false
onready var tower = preload("res://Towers/BasicLauncher.tscn")
onready var mc = preload("res://Towers/MachineGun.tscn")
func _physics_process(delta):
	if Input.is_action_pressed("right"):
		apply_torque_impulse(50)
	if Input.is_action_pressed("left"):
		apply_torque_impulse(-50)
	if Input.is_action_pressed("forward"):
		apply_central_impulse(Vector2(0,5).rotated(rotation))
	if Input.is_action_pressed("backward"):
		apply_central_impulse(Vector2(0,-5).rotated(rotation))
	if GettingEnergy:
		Energy+=.01
	if Input.is_action_just_pressed("DropTower") and Energy >= 10:
		var cur = tower.instance()
		cur.position = position
		get_tree().current_scene.add_child(cur)
		Energy -= 10
	if Input.is_action_just_pressed("DropTower2") and Energy >= 10:
		var cur = mc.instance()
		cur.position = position
		get_tree().current_scene.add_child(cur)
		Energy -= 10
	print(Energy)
