extends Area2D

onready var Hospital = get_parent().get_node("Hospital")


func _on_HospitalLeave_body_entered(body):
	Hospital.Collision.visible = false
	Hospital.Collider.visible = false
	print("Collision")



func _on_AfterHospitalLeave_body_entered(body):
	Hospital.Collision.visible = true
	Hospital.Collider.visible = true
