extends NPCState

func enter(previous_state_path: String, data := {}) -> void:
	update_animation()
	
func physics_update(delta: float) -> void:
	if npc.global_position.x < 1200:
		npc.dir = 1
		npc.animated_sprite_2d.flip_h = false
	elif npc.global_position.x > 1300:
		npc.dir = -1
		npc.animated_sprite_2d.flip_h = true
	#if npc.target_p == null:
		#return
	npc.velocity.x = npc.dir * 75

	npc.move_and_slide()

func update_animation():
	npc.animated_sprite_2d.play("walk")


func _on_interact_area_body_entered(body):
	if body is Player:
		npc.seen_player = true
		npc.target_p = body
		var distance_x = npc.target_p.global_position.x - npc.global_position.x
		var direction = sign(distance_x)
		if direction > 0:
			npc.animated_sprite_2d.flip_h = false
		elif direction < 0:
			npc.animated_sprite_2d.flip_h = true
		finished.emit("IdleState")
