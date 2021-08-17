extends KinematicBody2D

var moveSpeed = 500
var bulletSpeed = 1000

var bullet = load("res://Bullet.tscn")
var explosion = preload("res://Particles.tscn")
onready var player = get_node("Sprite")
onready var HospitalScreen = get_parent().get_node("CanvasLayer/MarginContainer/Treatment")



func _process(delta):

	
	
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("shoot"):
		if HospitalScreen.isInScene == false:
			var bullet_instance = bullet.instance()
			
			bullet_instance.rotation_degrees = rotation_degrees
			bullet_instance.position = position
			bullet_instance.apply_impulse(Vector2(), Vector2(bulletSpeed, 0).rotated((rotation)))
			get_tree().get_root().call_deferred("add_child", bullet_instance)
		

func _physics_process(delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("move_down"):
		motion.y += 1
	if Input.is_action_pressed("move_up"):
		motion.y -= 1
	if Input.is_action_pressed("move_left"):
		motion.x -= 1
	if Input.is_action_pressed("move_right"):
		motion.x += 1
		
	motion = motion.normalized()
	motion = move_and_slide(motion * moveSpeed)
	


