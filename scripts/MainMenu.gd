extends Control

@onready var play_button = $GameOptions/PlayButton
@onready var settings_button = $GameOptions/SettingsButton
@onready var credits_button = $GameOptions/CreditsButton
@onready var quit_button = $GameOptions/QuitButton

func _ready():
	# Connect buttons to their functions
	play_button.pressed.connect(_on_play_pressed)
	settings_button.pressed.connect(_on_settings_pressed)
	credits_button.pressed.connect(_on_credits_pressed)
	quit_button.pressed.connect(_on_quit_pressed)

# === BUTTON FUNCTIONS ===

func _on_play_pressed():
	print("Play button pressed")
	get_tree().change_scene_to_file("res://assets/scenes/Game.tscn")

func _on_settings_pressed():
	print("Settings button pressed")
	get_tree().change_scene_to_file("res://assets/scenes/SettingsMenu.tscn")

func _on_credits_pressed():
	print("Credits button pressed")
	get_tree().change_scene_to_file("res://assets/scenes/CreditsMenu.tscn")

func _on_quit_pressed():
	print("Quit button pressed")
	get_tree().quit()
