extends Control

var ClickedPlay = false

onready var Screen = get_parent()
onready var AboutSection = get_node("About Section")
onready var AboutBack = get_node("About Section/Button")

func _process(delta):
	var childs = get_children()
	var PlayButton = get_node("Play")
	var AboutButton = get_node("About")
	var QuitButton = get_node("Quit")
	var WhiteThing = get_node("Sprite2")
	if PlayButton.pressed == true:
		var screen1 = Screen.get_children()
		
		for child in childs:
			child.visible = false
			
		WhiteThing.queue_free()
		
	
		visible = false
		
		
		
		
		ClickedPlay = true
	
	if AboutButton.pressed == true:
		AboutSection.visible = true
		
	if AboutBack.pressed == true:
		AboutSection.visible = false
		
	if QuitButton.pressed == true:
		get_tree().quit()
		
	
