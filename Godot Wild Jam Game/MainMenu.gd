extends Control

var ClickedPlay = false
onready var PlayButton = get_node("Play")

func _process(delta):
	if PlayButton.pressed == true:
		get_tree().change_scene("res://world.tscn")
