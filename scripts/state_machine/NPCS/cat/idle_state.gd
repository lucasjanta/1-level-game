extends NPCState

@onready var cat_npc = $"../.."

func enter(previous_state_path: String, data := {}) -> void:
	$"../..".velocity.x = 0
	npc.talk_label.visible = true
	update_animation()
	if npc.can_interact:
		DialogueManager.show_dialogue_balloon(cat_npc.resource, "start")
		npc.can_interact = false
	
func physics_update(delta: float) -> void:		
	npc.move_and_slide()
	if Input.is_action_just_pressed("interact"):
		Global.player.idle_state.change_to_pet_state()
		npc.talk_label.visible = false
		finished.emit("PetState")

func update_animation():
	npc.animated_sprite_2d.play("idle")

func _on_interact_area_body_exited(body):
	if body is Player:
		npc.talk_label.visible = false
		finished.emit("WalkState")
