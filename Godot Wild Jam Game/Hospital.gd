extends StaticBody2D


var HasEntered = false
var isInHospital = false
var hitColliderOnExit = false
onready var Collision = get_node("Area2D/CollisionShape2D")
onready var Collider = get_node("Area2D")


func _ready():
	var timer = get_node("Timer")
	timer.wait_time = 1
	isInHospital = false

func _on_Timer_timeout():
	if isInHospital == false:
		HasEntered = false
		print("Player allowed to go to hospital")	

func _on_AfterHospitalLeave_body_entered(body):
	Collision.visible = false
	Collider.visible = false

func _on_Area2D_body_entered(body):
	var Player = get_parent().get_node("Player")
	var Cabinet = get_parent().get_node("Cupboard")
	var HospitalPos = Vector2(-5357.238, -2413.028)
	var timer = get_node("Timer")
	timer.wait_time = 1

	timer.wait_time = 1
	if body.name == "Player" or body.name == "PlayerCollider" or body.name == "PlayerArena" and Collision.visible == true and Collider.visible == true:			
		if Collider.visible == true and Collision.visible == true:
			Player.position = HospitalPos
			HasEntered = true
			isInHospital = false
			
			Cabinet.visible = true
		
	





