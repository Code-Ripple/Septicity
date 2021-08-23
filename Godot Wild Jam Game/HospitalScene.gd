extends Node2D



onready var HospitalPosition = get_parent().get_node("Hospital")
onready var cupboard = get_parent().get_node("Cupboard")


func _process(delta):
	
	
	var button = get_parent().get_node("CanvasLayer/MarginContainer/Hospital Purchasing/Back2")
	var HospitalScreen = get_parent().get_node("CanvasLayer/MarginContainer/Hospital Purchasing")
	var HospitalPosition = get_parent().get_node("Hospital")
	var buttonOpen = get_parent().get_node_or_null("HospitalOpen")

	if button.pressed == true:
		HospitalScreen.visible = false
		print("Pressed")
	if buttonOpen.pressed == true:
		HospitalScreen.visible = true
		print("Pressed")
		
		
		
	


		
