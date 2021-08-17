extends Area2D

var isVisible = false

func _on_EnemySpawnArea_body_entered(body):
	var Enemy = get_node("Enemy")
	var EnemyCollision = get_node("Enemy/Area2D")
	var EnemyCollider = get_node("Enemy/CollisionShape2D")
	var PositionVector = Vector2(position.x, position.y)
	

	isVisible = true
	Enemy.visible = true
	EnemyCollision.visible = true
	EnemyCollider.visible = true
