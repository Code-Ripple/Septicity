extends RigidBody2D


func _on_Area2D_body_entered(body):
	if body != self and body.name != "Player" and body.name != "PlayerCollider" and body.name != "PlayerArena":	
		queue_free()
