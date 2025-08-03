extends NPCState

func enter(previous_state_path: String, data := {}) -> void:
	update_animation()
	
func physics_update(delta: float) -> void:
	if npc.global_position.x < 3020:
		npc.dir = 1
		npc.animated_sprite_2d.flip_h = false
	elif npc.global_position.x > 4100:
		npc.dir = -1
		npc.animated_sprite_2d.flip_h = true
	npc.velocity.x = npc.dir * 75
	npc.move_and_slide()

func update_animation():
	npc.animated_sprite_2d.play("walk")
	


func _on_interact_area_body_entered(body):
	if body is Player:
		finished.emit("IdleState")
