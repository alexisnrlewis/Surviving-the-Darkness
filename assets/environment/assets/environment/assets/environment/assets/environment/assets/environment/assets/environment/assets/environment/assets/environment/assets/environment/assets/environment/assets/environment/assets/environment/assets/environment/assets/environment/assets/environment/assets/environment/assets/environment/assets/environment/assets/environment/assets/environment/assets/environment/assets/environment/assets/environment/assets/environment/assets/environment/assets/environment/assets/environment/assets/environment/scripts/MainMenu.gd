extends Control

# Reference to AudioManager
var AudioManagerInstance : Node = null

func _ready():

	# Connect Quit button
	$MenuButtons/QuitButton.pressed.connect(Callable(self, "_on_quit_pressed"))

	# Connect Options button
	$MenuButtons/SettingsButton.pressed.connect(Callable(self, "_on_options_pressed"))

	# Connect Start button
	$MenuButtons/StartButton.pressed.connect(Callable(self, "_on_start_pressed"))


# Quit the game
func _on_quit_pressed():
	get_tree().quit()


# Load OptionsMenu scene
func _on_options_pressed():
	var options_scene = load("res://assets/SettingsMenu.tscn")
	if options_scene:
		var options_instance = options_scene.instantiate()
		get_tree().root.add_child(options_instance)
		hide()  # hide main menu while options menu is visible
	else:
		push_error("❌ Could not load SettingsMenu scene! Check the path.")


# Start the game → load HealthBar scene
func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/HealthBar.tscn")  # update path if needed
