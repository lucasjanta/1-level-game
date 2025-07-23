extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	update_animation()
		
	
func physics_update(_delta: float) -> void:
	if player.direction > 0:
		player.velocity.x = player.speed * player.direction
	if player.direction < 0:
		player.velocity.x = player.speed * player.direction
	if player.direction == 0:
		finished.emit("IdleState")
	
	if player.direction > 0:
		player.animated_sprite_2d.flip_h = false
	elif player.direction < 0:
		player.animated_sprite_2d.flip_h = true
		
	player.move_and_slide()
	
	if player.is_on_floor() and Input.is_action_just_pressed("jump"):
		finished.emit("JumpState")
	
	if !player.is_on_floor():
		finished.emit("LandState")
	

func update_animation():
	player.animated_sprite_2d.play("walk")
		
