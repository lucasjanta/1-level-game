extends Control

func _on_restart_button_pressed():
	Global.active_dialogue = false
	Global.coins = 100
	Global.druid_pot = false
	Global.talk_to_daughter = false
	Global.warn_father = false
	Global.pet_cat = false
	Global.king_first_impression = false
	visible = false
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_quit_button_pressed():
	get_tree().quit()
