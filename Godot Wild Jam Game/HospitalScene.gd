extends Node2D


onready var button = get_parent().get_node("CanvasLayer/MarginContainer/Hospital Purchasing/Back2")
onready var buttonOpen = get_node("Button")
func _process(delta):
	
	
	
	var HospitalScreen = get_parent().get_node("CanvasLayer/MarginContainer/Hospital Purchasing")

	if button.pressed == true:
		HospitalScreen.visible = false
	if buttonOpen.pressed == true:
		HospitalScreen.visible = true
		
	

func _on_Area2D_body_entered(body):
	var HospitalPosition = get_parent().get_node("Hospital")
	var hospitalPosition = HospitalPosition.get_position()
	var HospitalY = hospitalPosition.y - 20
	var positionToTeleport = Vector2(HospitalPosition.position.x, HospitalY)
	
	
	if body.name == "Player" or body.name == "PlayerCollider" or body.name == "PlayerArena":
		body.position = hospitalPosition
		hospitalPosition.y -= 10
		
		
