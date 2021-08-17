extends StaticBody2D


var HasEntered = false


func _on_Timer_timeout():
	HasEntered = false
	print("Player allowed to go to hospital")	


func _on_Area2D_body_entered(body):
	var Player = get_parent().get_node("Player")
	var HospitalPos = Vector2(-5357.238, -2413.028)
	var timer = get_node("Timer")
	
	if HasEntered == false:		
		if body.name == "Player" or body.name == "PlayerCollider" or body.name == "PlayerArena":			
			Player.position = HospitalPos
			HasEntered = true
			timer.wait_time = 30
			
		


