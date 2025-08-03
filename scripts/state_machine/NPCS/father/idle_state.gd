extends NPCState

func enter(previous_state_path: String, data := {}) -> void:
	npc.velocity.x = 0
	update_animation()
	
	
func physics_update(delta: float) -> void:		
	npc.move_and_slide()
	if npc.target_p == null:
		npc.target_p = Global.player
	if npc.target_p.global_position < npc.global_position:
		npc.animated_sprite_2d.flip_h = true
	elif npc.target_p.global_position > npc.global_position:
		npc.animated_sprite_2d.flip_h = false
	if npc.seen_player:
		finished.emit("WalkState")
	

func update_animation():
	npc.animated_sprite_2d.play("idle")


func _on_interact_area_body_entered(body):
	if body is Player and !npc.seen_player:
		npc.can_interact = true
		npc.talk_label.visible = true


func _on_interact_area_body_exited(body):
	if body is Player and !npc.seen_player:
		npc.can_interact = false
		npc.talk_label.visible = false
