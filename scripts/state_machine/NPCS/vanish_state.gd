extends NPCState

func enter(previous_state_path: String, data := {}) -> void:
	npc.velocity.x = 0
	update_animation()
	
func update_animation():
	npc.animated_sprite_2d.play("death")

func _on_animated_sprite_2d_animation_finished():
	npc.queue_free()
