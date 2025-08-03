extends NPCState

func enter(previous_state_path: String, data := {}) -> void:
	npc.animated_sprite_2d.flip_h = true
	update_animation()
	
func physics_update(delta: float) -> void:
	npc.velocity.y = 300
	npc.move_and_slide()
	if npc.is_on_floor():
		npc.velocity.y = 0
		finished.emit("IdleState")

func update_animation():
	npc.animated_sprite_2d.play("fall")
	
