extends Control

var reached5 = false
var virusInfections = 0
var isInScene
var checkedChecker = false

func _process(delta):
	var timer = get_node("Timer")
	timer.wait_time = 0.27
	timer.wait_time = 0.27

	
	var button = get_node("Button2")
	var checked = get_node("CheckButton")
	var text = get_node("Label3")
	var backButton = get_node("Button")
	var world = get_parent().get_parent().get_parent()
	var MainHospital = get_parent().get_node("Hospital Purchasing")

	if world.PlayerInfected == false:
		checked.pressed = false
	
	print(checked.pressed)
	
	if checked.pressed == true:
		checkedChecker = true
	if world.PlayerInfected == false:
		checked.pressed = true

	if visible == true:
		isInScene = true
	if visible == false:
		isInScene = false
	
	if backButton.pressed == true: 
		MainHospital.visible = true
		visible = false
			
	if button.pressed == true and world.PlayerInfected == true:
		virusInfections += 1


	if virusInfections > 10:
		virusInfections = 10

		
	if virusInfections == 10:
		timer.autostart = true
	
	if virusInfections != 10:
		checked.pressed = false
		checkedChecker = false

		
	text.text = str(virusInfections)

func _on_Timer_timeout():
	var checked = get_node("CheckButton")
	
	var text = get_node("Label3")
	text.text = str(virusInfections)
	if virusInfections > 0 and checked.pressed == false:
		virusInfections -= 1
		
	
