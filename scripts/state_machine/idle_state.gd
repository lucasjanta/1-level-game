extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	$"../..".velocity.x = 0
	update_animation()
	
func physics_update(_delta: float) -> void:
	player.move_and_slide()
	if player.can_move and !Global.active_dialogue:
		if player.direction != 0:
			finished.emit("WalkState")
		if Input.is_action_just_pressed("jump"):
			finished.emit("JumpState")

func update_animation():
	player.animated_sprite_2d.play("idle")
	if player.direction > 0:
		player.animated_sprite_2d.flip_h = false
	elif player.direction < 0:
		player.animated_sprite_2d.flip_h = true
		
func use_item():
	print("foi")
	finished.emit("UseItemState")

func change_to_pet_state():
	finished.emit("PetState")
