extends Control

@onready var back_button = $BackButton
@onready var fullscreen_check_button = $FullscreenCheckButton

func _ready():
	# Connect Back button to function
	back_button.pressed.connect(_on_BackButton_pressed)
	
	# Set the CheckButton pressed state to current fullscreen mode
	if fullscreen_check_button:
		fullscreen_check_button.button_pressed = DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN
		# Connect the fullscreen toggle
		fullscreen_check_button.toggled.connect(_on_FullscreenCheckButton_toggled)

# Go back to SettingsMenu
func _on_BackButton_pressed():
	get_tree().change_scene_to_file("res://assets/SettingsMenu.tscn")

# Fullscreen toggle
func _on_FullscreenCheckButton_toggled(button_pressed: bool) -> void:
	if button_pressed:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
