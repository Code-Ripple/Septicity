extends Area2D

var isVisible = false

var EnemyScene = preload("res://Enemy.tscn")

func _on_EnemySpawnArea_body_entered(body):
	var PositionVector = Vector2(position.x, position.y)
	var Enemy = EnemyScene.instance()
	
	
	
