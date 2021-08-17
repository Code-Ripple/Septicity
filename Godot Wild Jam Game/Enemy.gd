extends KinematicBody2D

var motion = Vector2()

var Health = 100

var bullet = preload("res://Art/Bullet.png")
var explosion = load("res://Particles.tscn").instance()
var bulletSpeed = 1000

func _process(delta):

	
	if Health <= 0:
		queue_free()
	print(position)

func _physics_process(delta):
	var world = get_parent()
	var Player = world.get_node("Player")


	position += (Player.position - position)/40
		
	move_and_collide(motion)
	


func _on_Area2D_body_entered(body):

		
	Health -= 20

	body.queue_free()
	queue_free()
	

	
