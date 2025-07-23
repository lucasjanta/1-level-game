class_name NPCState extends State

var npc : Npc

func _ready() -> void:
	await owner.ready
	npc = owner as Npc
	assert(npc != null, "The PlayerState state type must be used only in the player scene. It needs the owner to be a Player node.")
