extends StaticBody2D


onready var KeyNumbers = get_parent()
onready var timer = get_node("Timer")
onready var text = get_parent().get_node("CanvasLayer/MarginContainer/Control/KeyMessage")
onready var keyNumber1 = get_parent().get_node("Key1")
onready var keyNumber2 = get_parent().get_node("Key2")
onready var keyNumber3 = get_parent().get_node("Key3")
onready var CabinetScreen = get_parent().get_node("CanvasLayer/MarginContainer/CabinetScreen")



func _on_Area2D_body_entered(body):
	var keyNumber = keyNumber1.KeyNumber + keyNumber2.KeyNumber + keyNumber3.KeyNumber

	if keyNumber != 3 and body.name == "Player":
		print("Player does not have 3 keys")
		timer.wait_time = 0.8
		text.visible = true
		timer.autostart = true
		text.text = "You need 3 keys to open the cupboard!"
		
	
	if keyNumber == 3 and body.name == "Player":
		print("Player entered with 3 keys")
		CabinetScreen.visible = true
	


func _on_Timer_timeout():
	if visible == true:
		text.visible = false
		
