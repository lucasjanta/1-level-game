extends Control

func _on_restart_button_pressed():
	visible = false
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_quit_button_pressed():
	get_tree().quit()
