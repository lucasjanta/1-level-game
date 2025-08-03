extends NPCState

var turn_timer: float = 0.0

func enter(previous_state_path: String, data := {}) -> void:
	npc.velocity.x = 0
	update_animation()
	
	if Global.druid_pot:
		finished.emit("VanishState")


func physics_update(delta: float) -> void:
	# Se não pode interagir com o player, fica virando aleatoriamente
	if !npc.seen_player:
		if turn_timer <= 0.0:
			npc.animated_sprite_2d.flip_h = not npc.animated_sprite_2d.flip_h
			turn_timer = randf_range(0.7, 3.0)
		else:
			turn_timer -= delta


	npc.move_and_slide()


func update_animation() -> void:
	npc.animated_sprite_2d.play("idle")


func _on_detection_area_body_entered(body) -> void:
	if body is Player:
		if !npc.seen_player:
			npc.target_p = body
			var distance_x = npc.target_p.global_position.x - npc.global_position.x
			var direction = sign(distance_x)
			if direction > 0:
				npc.animated_sprite_2d.flip_h = false
			elif direction < 0:
				npc.animated_sprite_2d.flip_h = true
			DialogueManager.show_dialogue_balloon(npc.resource, "start")
			npc.seen_player = true
		else:
			npc.can_interact = true
			npc.talk_label.visible = true


func _on_detection_area_body_exited(body) -> void:
	if body is Player:
		npc.can_interact = false
		npc.talk_label.visible = false
