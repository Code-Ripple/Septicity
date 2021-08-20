extends KinematicBody2D

var motion = Vector2()

var Health = 100
var PlayerInfected = false

var DarkerHeart = preload("res://Art/Darker Heart.png")
var bullet = preload("res://Art/Bullet.png")
var explosion = load("res://Particles.tscn").instance()
onready var Player = get_parent().get_node("Player")
var bulletSpeed = 1000

func _process(delta):

	
	if Health <= 0:
		queue_free()


func _physics_process(delta):
	var world = get_parent()
	var Player = world.get_node("Player")


	if visible == true and Player.PlayerIsDead == false:
		
		position += (Player.position - position)/20
		
	move_and_collide(motion)
	


func _on_Area2D_body_entered(body):
	var world = get_parent()
	var infectedScreen = world.get_node("CanvasLayer2/InfectedScreen")
	if body.name == "Player" or body.name == "PlayerCollider" or body.name == "PlayerArena":	
		world.Heart1.texture = DarkerHeart
		world.Heart2.texture = DarkerHeart
		world.Heart3.texture = DarkerHeart
		world.PlayerInfected = true
		infectedScreen.visible = true


			
	if body != self:
		Health -= 20
	

	
