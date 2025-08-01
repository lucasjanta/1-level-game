extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	$"../..".velocity.x = 0
	update_animation()
	
func physics_update(_delta: float) -> void:
	player.move_and_slide()

func update_animation():
	player.animated_sprite_2d.flip_h = false
	player.animation_player.play("use")
	
func next_state():
	finished.emit("IdleState")
