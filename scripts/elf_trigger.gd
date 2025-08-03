extends Node

var spawned_elf := false
@onready var spawn_marker = $Marker2D
@onready var force_field = $force_field/CollisionShape2D

const ELF_NPC = preload("res://scenes/elf_npc.tscn")

func _ready():
	Global.force_field = force_field


func _on_elf_spawn_body_entered(body):
	if body is Player and !spawned_elf:
		var new_elf = ELF_NPC.instantiate()
		get_parent().call_deferred("add_child", new_elf)
		new_elf.global_position = spawn_marker.global_position
		spawned_elf = true
