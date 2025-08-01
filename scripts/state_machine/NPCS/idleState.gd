extends NPCState

var turn_timer = 0.0
@onready var druid_npc = $"../.."


func enter(previous_state_path: String, data := {}) -> void:
	$"../..".velocity.x = 0
	update_animation()
	#if npc.target_p != null:
		#if npc.seen_player:
			#DialogueManager.show_dialogue_balloon(druid_npc.resource, "start")
			#print("start talking")
		
	
func physics_update(delta: float) -> void:
	
	if npc.target_p != null:
		var distance_x = npc.target_p.global_position.x - npc.global_position.x
		if abs(distance_x) > 25:
			npc.can_interact = false
			npc.talk_label.visible = false
		else:
			npc.can_interact = true
			npc.talk_label.visible = true
		
	if !npc.seen_player:
		if turn_timer <= 0.0:
			npc.animated_sprite_2d.flip_h = !npc.animated_sprite_2d.flip_h
			turn_timer = randf_range(0.7,5.0)
		else:
			turn_timer -= delta
		run_to_player()
		
	npc.move_and_slide()

func update_animation():
	npc.animated_sprite_2d.play("idle")


func _on_detection_area_body_entered(body):
	if body is Player:
		npc.target_p = body
		

func _on_detection_area_body_exited(body):
	if body is Player:
		npc.target_p = null

func run_to_player():
	if npc.target_p != null:
		if npc.animated_sprite_2d.flip_h == true and npc.position.x > npc.target_p.position.x:
			finished.emit("WalkState")
		if npc.animated_sprite_2d.flip_h == false and npc.position.x < npc.target_p.position.x:
			finished.emit("WalkState")
