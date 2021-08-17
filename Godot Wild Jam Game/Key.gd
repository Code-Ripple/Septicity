extends StaticBody2D

var KeyNumber = 0

func _on_Area2D_body_entered(body):
	var Collision = get_node("Area2D")
	var KeyPickupSFX = get_parent().get_node("KeyPickupSFX")
		
	if body.name == "Player" or body.name == "PlayerCollider" or body.name == "PlayerArena":
		print("Player Collided With Key")
		KeyNumber += 1
		KeyPickupSFX.playing = true
		visible = false
		Collision.queue_free()
		
