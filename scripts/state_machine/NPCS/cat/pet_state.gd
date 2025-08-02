extends NPCState

func enter(previous_state_path: String, data := {}) -> void:
	update_animation()
	
func physics_update(delta: float) -> void:
	npc.move_and_slide()

func update_animation():
	npc.animated_sprite_2d.play("pet")

func _on_interact_area_body_exited(body):
	if body is Player:
		finished.emit("WalkState")
