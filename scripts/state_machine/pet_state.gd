extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	$"../..".velocity.x = 0
	update_animation()
	
func physics_update(_delta: float) -> void:
	player.move_and_slide()

func update_animation():
	player.animation_player.play("pet")

func next_state():
	finished.emit("IdleState")
