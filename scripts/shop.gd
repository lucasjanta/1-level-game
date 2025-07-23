extends Node2D

var can_interact := false

func _on_area_2d_body_entered(body):
	if body is Player:
		print("player entered the shop area")



func _on_area_2d_body_exited(body):
	if body is Player:
		print("player left the shop area")
