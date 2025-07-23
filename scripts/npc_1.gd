class_name Npc extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var talk_label = $talk_label

var target_p : Player
var seen_player = false
var can_interact : bool = false
var resource
