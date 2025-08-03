extends NPCState

func enter(previous_state_path: String, data := {}) -> void:
	npc.velocity.x = 0
	update_animation()
	#npc.talk_label.visible = true
	
func physics_update(delta: float) -> void:		
	npc.move_and_slide()
	#if Input.is_action_just_pressed("interact"):
		#npc.talk_label.visible = false

func update_animation():
	npc.animated_sprite_2d.play("idle")


func _on_interact_area_body_entered(body):
	if body is Player:
		if !npc.seen_player:
			DialogueManager.show_dialogue_balloon(npc.resource, "start")
			npc.seen_player = true
		if npc.seen_player:
			npc.can_interact = true
			npc.talk_label.visible = true
		
		
func _on_interact_area_body_exited(body):
	if body is Player:
		npc.talk_label.visible = false
		npc.can_interact = false
		if Global.force_field.disabled:
			finished.emit("WalkState")
			npc.seen_player = true
