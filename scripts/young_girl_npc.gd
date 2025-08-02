extends Npc

var dir : int = 1



func _on_visibility_changed():
	if visible:
		process_mode = Node.PROCESS_MODE_ALWAYS
	if !visible:
		process_mode = Node.PROCESS_MODE_DISABLED
