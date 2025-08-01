extends StaticBody2D

@onready var door_label = $door_label
@onready var wall_left = $wall_left
@onready var wall_right = $wall_right
@onready var second_floor_ground = $second_floor_ground
@onready var rooftop = $rooftop
@onready var stairs = $stairs
@onready var young_girl_npc = $young_girl_npc

@onready var furniture = $furniture

@onready var animated_sprite_2d = $AnimatedSprite2D

var can_enter := false
var inside_doors := false


func _on_door_area_body_entered(body):
	if body is Player:
		door_label.visible = true
		can_enter = true
		

func _on_door_area_body_exited(body):
	if body is Player:
		door_label.visible = false
		can_enter = false

func _unhandled_input(event):
	if event.is_action_pressed("interact") and can_enter and !inside_doors:
		animated_sprite_2d.play("open_door")
		await get_tree().create_timer(0.3).timeout
		inside_doors = true
		animated_sprite_2d.play("inside")
		toggle_collisions()
	elif event.is_action_pressed("interact") and can_enter and inside_doors:
		animated_sprite_2d.play_backwards("open_door")
		toggle_collisions()
		inside_doors = false
		await get_tree().create_timer(0.3).timeout
		

func toggle_collisions():
	wall_left.disabled = !wall_left.disabled
	wall_right.disabled = !wall_right.disabled
	second_floor_ground.disabled = !second_floor_ground.disabled
	rooftop.disabled = !rooftop.disabled
	stairs.disabled = !stairs.disabled
	furniture.visible = !furniture.visible
	young_girl_npc.visible = !young_girl_npc.visible
