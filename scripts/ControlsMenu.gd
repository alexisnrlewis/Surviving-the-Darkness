extends Control

@onready var back_button = $BackButton

func _ready():
	# Connect Back button to function
	back_button.pressed.connect(Callable(self, "_on_BackButton_pressed"))

# Go back to SettingsMenu
func _on_BackButton_pressed():
	get_tree().change_scene_to_file("res://assets/scenes/SettingsMenu.tscn")
