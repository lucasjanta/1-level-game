extends NPCState


func enter(previous_state_path: String, data := {}) -> void:
	update_animation()
	
func physics_update(delta: float) -> void:
	npc.move_and_slide()
	if npc.target_p == null:
		npc.target_p = Global.player
	var distance_x = npc.target_p.global_position.x - npc.global_position.x
	var direction = sign(distance_x)

	# Seguir apenas se o player estiver a uma certa distância (ex: 20 pixels)
	if abs(distance_x) > 25:
		npc.velocity.x = direction * 100
	else:
		if !npc.seen_player:
			DialogueManager.show_dialogue_balloon(npc.resource, "start")
			npc.seen_player = true
			finished.emit("idleState")
		
	

func update_animation():
	npc.animated_sprite_2d.play("walk")
	

func _on_detection_area_body_exited(body):
	if body is Player:
		finished.emit("idleState")
