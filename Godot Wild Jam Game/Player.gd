extends KinematicBody2D

var moveSpeed = 500
var bulletSpeed = 1000

var health = 3
var PlayerIsDead = false

var bullet = load("res://Bullet.tscn")
var explosion = preload("res://Particles.tscn")
onready var player = get_node("Sprite")
onready var HospitalScreen = get_parent().get_node("CanvasLayer/MarginContainer/Treatment")
onready var Hospital = get_parent().get_node("Hospital")
onready var world = get_parent()



func _process(delta):

	if health == 3:
		world.Heart1.visible = true
		world.Heart2.visible = true
		world.Heart3.visible = true
	if health < 3 and health > 1:
		world.Heart1.visible = false
		world.Heart2.visible = true
		world.Heart3.visible = true
	if health < 1:
		world.Heart1.visible = false
		world.Heart2.visible = false
		world.Heart3.visible = true
		
	if health <= 0:
		world.Heart1.visible = false
		world.Heart2.visible = false
		world.Heart3.visible = false
		visible = false	
		PlayerIsDead = true
		world.GameOver = true
	
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("shoot"):
		if HospitalScreen.isInScene == false and world.GameOver == false and world.WonGame == false:
			var bullet_instance = bullet.instance()
			
			bullet_instance.rotation_degrees = rotation_degrees
			bullet_instance.position = position
			bullet_instance.apply_impulse(Vector2(), Vector2(bulletSpeed, 0).rotated((rotation)))
			get_tree().get_root().call_deferred("add_child", bullet_instance)
		

func _physics_process(delta):
	var motion = Vector2()
	
	if HospitalScreen.isInScene == false and world.GameOver == false and world.WonGame == false:
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
		


