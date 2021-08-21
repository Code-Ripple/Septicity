extends Node2D

var Civilians = 0
var GameOver = false
onready var Heart1 = get_node("CanvasLayer/Normal Hearts/Heart1")
onready var Heart2 = get_node("CanvasLayer/Normal Hearts/Heart2")
onready var Heart3 = get_node("CanvasLayer/Normal Hearts/Heart3")

var LightHeart = preload("res://Normal Hearts.tscn")
var PlayerInfected = false
var WonGame = false

var Hearts = [Heart1, Heart2, Heart3]


func _process(delta):

	print(Heart1.visible)
	print(Heart2.visible)
	print(Heart3.visible)

	var Pos = Vector2(0, 0)
	var Enemy = get_node("Enemy")

	var GameOverScreen = get_node("CanvasLayer/GameOver")

	var Text = get_node("CanvasLayer/MarginContainer/Control/Label")
	var KeyText = get_node("CanvasLayer/MarginContainer/Control/Label2")

	var Player = get_node("Player")
	var HospitalScreen = get_node("CanvasLayer/MarginContainer/Hospital Purchasing")
	var GetTreatment = HospitalScreen.get_node("Button2")
	var TreatmentScreen = get_node("CanvasLayer/MarginContainer/Treatment")
	var infectScreen = get_node("CanvasLayer2/InfectedScreen")
	var InfectLayer = get_node("CanvasLayer2")
	var WinButton = get_node("CanvasLayer/MarginContainer/CabinetScreen/Button")
	var cabinetScreen = get_node("CanvasLayer/MarginContainer/CabinetScreen")
	var VictoryScreen = get_node("CanvasLayer/MarginContainer/VictoryScreen")
	var GameOverText = get_node("CanvasLayer/GameOver/Label2")




	Text.text = str(Civilians) + "/15"

	var Key1 = get_node("Key1")
	var Key2 = get_node("Key2")
	var Key3 = get_node("Key3")
	var KeyNumber = Key1.KeyNumber
	var KeyNumber2 = Key2.KeyNumber
	var KeyNumber3 = Key3.KeyNumber
	var KeyNumbersTotal = KeyNumber + KeyNumber2 + KeyNumber3


	KeyText.text = str(KeyNumber + KeyNumber2 + KeyNumber3)

	if Player.health <= 0:
		GameOverScreen.visible = true
		


	if TreatmentScreen.checkedChecker == true:
		PlayerInfected = false
		Heart1.texture = LightHeart
		Heart2.texture = LightHeart
		Heart3.texture = LightHeart
		Heart1.visible = true
		Heart2.visible = true
		Heart3.visible = true
		Player.health = 3
		infectScreen.visible = false



	if GetTreatment.pressed == true and PlayerInfected == true:
		HospitalScreen.visible = false
		TreatmentScreen.visible = true

	if WinButton.pressed == true:
		VictoryScreen.visible = true
		cabinetScreen.visible = false
		WonGame = true





	if Civilians >= 15:
		GameOver = true
		GameOverText.text = "You lost. The virus has killed every civilian."

	if GameOver == true:
		if PlayerInfected == true:
			GameOverText.text = "You lost. You got infected by the virus"
		infectScreen.visible = false
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
	if Civilians <= 15 and GameOver == false and WonGame == false:
		Civilians += 1


func _on_PlayerInfectTimer_timeout():
	var Enemy = get_node("Enemy")
	var Player = get_node("Player")

	if PlayerInfected == true:
		Player.health -= 0.4


func _on_House1_body_entered(body):
	var Player = get_node("Player")
	var HouseWorld1 = get_node("House1World")
	Player.position = HouseWorld1.position


func _on_House1Leave_body_entered(body):
	var Player = get_node("Player")
	var ExitPosition = get_node("Sprite3").position
	if body.name == "Player" or body.name == "PlayerCollider":
		Player.position = ExitPosition


func _on_House2_body_entered(body):
	var HousePosition = get_node("House2World")
	var Player = get_node("Player")
	if body.name == "Player" or body.name == "PlayerCollider":
		Player.position = HousePosition.position


func _on_House2Leave_body_entered(body):
	var Player = get_node("Player")
	var ExitPosition = get_node("Sprite2").position
	if body.name == "Player" or body.name == "PlayerCollider":
		Player.position = ExitPosition
