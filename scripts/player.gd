extends CharacterBody2D
class_name Player

@export var speed = 300.0
@export var gravity: float = 1200.0
@export var jump_force: float = 400.0
var direction = 0
var is_jumping : bool = false
var can_move : bool = false
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer
@onready var idle_state = $StateMachine/IdleState
@onready var itemanimation = $itemanimation


func _ready():
	Global.player = self

func _physics_process(delta):
	if can_move:
		direction = Input.get_axis('left', 'right')
	
	if not is_on_floor():
		velocity.y += gravity * delta

func allow_movement():
	can_move = true
	
func disable_movement():
	can_move = false
