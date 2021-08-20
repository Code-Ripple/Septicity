extends Control

func _process(delta):
	var backButton = get_node("BackButton")
	
	if backButton.pressed == true:
		visible = false
