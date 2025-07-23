extends PlayerState


func enter(previous_state_path: String, data := {}) -> void:
	update_animation()
		
	
func physics_update(_delta: float) -> void:
			
	if player.direction > 0:
		player.velocity.x = player.speed * player.direction
		player.animated_sprite_2d.flip_h = false
	if player.direction < 0:
		player.velocity.x = player.speed * player.direction
		player.animated_sprite_2d.flip_h = true
	if player.direction == 0:
		player.velocity.x = 0
		
	player.move_and_slide()
		
	if player.is_on_floor():
		finished.emit("IdleState")

func update_animation():
	player.animated_sprite_2d.play("land")
		
