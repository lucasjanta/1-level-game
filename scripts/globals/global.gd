extends Node

var player : Player

var active_dialogue : bool = false
var coins = 100
var game_won_screen : Control
var shop_screen
# Variáveis para auxiliar nos diálogos
var force_field : CollisionShape2D
var druid_pot := false
var talk_to_daughter := false
var warn_father := false
var pet_cat := false
var king_first_impression := false

func force_field_off():
	force_field.disabled = true

func game_won():
	game_won_screen.visible = true
	get_tree().paused = true
