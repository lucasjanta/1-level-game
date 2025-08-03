extends NPCState

var turn_timer: float = 0.0

func enter(previous_state_path: String, data := {}) -> void:
	npc.velocity.x = 0
	update_animation()
	
	if Global.druid_pot:
		finished.emit("VanishState")


func physics_update(delta: float) -> void:
	if npc.target_p == null:
		npc.target_p = Global.player

	var distance_x = npc.target_p.global_position.x - npc.global_position.x

	# Se ainda não viu o player, fica virando aleatoriamente
	if not npc.seen_player:
		if turn_timer <= 0.0:
			npc.animated_sprite_2d.flip_h = not npc.animated_sprite_2d.flip_h
			turn_timer = randf_range(0.7, 3.0)
		else:
			turn_timer -= delta

		run_to_player()

	npc.move_and_slide()


func update_animation() -> void:
	if npc.animated_sprite_2d.animation != "idle":
		npc.animated_sprite_2d.play("idle")


func _on_detection_area_body_entered(body) -> void:
	if body is Player:
		npc.can_interact = true
		npc.talk_label.visible = true
		npc.seen_player = true  # Agora detecta a presença do player
		finished.emit("WalkState")


func _on_detection_area_body_exited(body) -> void:
	if body is Player:
		npc.can_interact = false
		npc.talk_label.visible = false


func run_to_player() -> void:
	# Se o NPC estiver virado para o player, ele entra no estado de andar
	if npc.animated_sprite_2d.flip_h and npc.position.x > npc.target_p.position.x:
		npc.seen_player = true
		finished.emit("WalkState")
	elif not npc.animated_sprite_2d.flip_h and npc.position.x < npc.target_p.position.x:
		npc.seen_player = true
		finished.emit("WalkState")
