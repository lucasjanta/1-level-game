extends NPCState

func enter(previous_state_path: String, data := {}) -> void:
	npc.animated_sprite_2d.flip_h = true
	npc.velocity.x = -195
	update_animation()
	#npc.talk_label.visible = true
	
func physics_update(delta: float) -> void:		
	npc.move_and_slide()

func update_animation():
	npc.animated_sprite_2d.play("walk")
