extends Npc


#var target_p : Player
#var seen_player = false
#var can_interact : bool = false
#var resource
var dir : int = 1



func _on_visibility_changed():
	if visible:
		process_mode = Node.PROCESS_MODE_ALWAYS
	if !visible:
		process_mode = Node.PROCESS_MODE_DISABLED
