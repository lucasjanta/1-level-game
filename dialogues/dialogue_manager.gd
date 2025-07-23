extends Node

var resource
var is_dialogue_active = false
@export var dialogue_path : String

func _ready():
	resource = load(dialogue_path)
	DialogueManager.dialogue_started.connect(on_dialogue_started)
	DialogueManager.dialogue_ended.connect(on_dialogue_ended)
	get_parent().resource = resource

func _unhandled_input(event):
	if event.is_action_pressed("interact") and get_parent().can_interact and !Global.active_dialogue:
		DialogueManager.show_dialogue_balloon(resource, "start")
		

func on_dialogue_started(dialogue):
	Global.active_dialogue = true
	
func on_dialogue_ended(dialogue):
	await get_tree().create_timer(0.1).timeout
	Global.active_dialogue = false
