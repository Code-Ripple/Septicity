extends Node2D

var Civilians = 0
var GameOver = false


func _process(delta):
	var Pos = Vector2(0, 0)
	var Enemy = get_node("Enemy2")
	
	var GameOverScreen = get_node("CanvasLayer/GameOver")
	
	var Text = get_node("CanvasLayer/MarginContainer/Control/Label")
	var KeyText = get_node("CanvasLayer/MarginContainer/Control/Label2")
	var Key1 = get_node("Key1")
	var Key2 = get_node("Key2")
	var Key3 = get_node("Key3")
	var Player = get_node("Player")
	var HospitalScreen = get_node("CanvasLayer/MarginContainer/Hospital Purchasing")
	var GetTreatment = HospitalScreen.get_node("Button2")
	var TreatmentScreen = get_node("CanvasLayer/MarginContainer/Treatment")

	var KeyNumber = Key1.KeyNumber
	var KeyNumber2 = Key2.KeyNumber
	var KeyNumber3 = Key3.KeyNumber
	var playerChildren = Player.get_children()
	
	Text.text = str(Civilians) + "/15"
	KeyText.text = str(KeyNumber + KeyNumber2 + KeyNumber3)
	
	if GetTreatment.pressed == true:
		HospitalScreen.visible = false
		TreatmentScreen.visible = true
		
	
		
		

	
	if Civilians > 15:
		GameOver = true
		
	if GameOver == true:
		GameOverScreen.visible = true
		Text.visible = false
		Player.visible = false
		var PlayerChildren = Player.get_children()
		var camera = Player.get_node("Camera2D")
		for playerChild in PlayerChildren:
			Player.remove_child(camera)
			playerChild.queue_free()
			print(playerChild)
		
		
		

func _on_Timer_timeout():
	if Civilians <= 15:
		Civilians += 1
