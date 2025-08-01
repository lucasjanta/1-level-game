extends Node2D
@onready var shop_label = $shop_label

var can_interact := false
var resource

func _on_area_2d_body_entered(body):
	if body is Player:
		print("player entered the shop area")
		shop_label.visible = true
		can_interact = true
	



func _on_area_2d_body_exited(body):
	if body is Player:
		print("player left the shop area")
		shop_label.visible = false
		can_interact = false
	
