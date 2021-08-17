extends RigidBody2D


var move = Vector2.ZERO
var look = Vector2.ZERO
var speed = 1000
var player = null

func _ready():
	look = player.position - global_position
	
func _physics_process(delta):
	move = Vector2.ZERO
	
	move = move.move_toward(look, delta)
	move = move.normalized() * speed
	position += move
