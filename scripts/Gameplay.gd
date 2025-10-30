extends Node

func _input(event):
	if event.is_action_pressed("ui_cancel"):  # Esc key by default
		get_tree().paused = true
		var pause_menu = load("res://scenes/PauseMenu.tscn").instantiate()
		get_tree().current_scene.add_child(pause_menu)
