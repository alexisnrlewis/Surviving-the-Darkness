extends Control

@onready var back_button = $BackButton
@onready var audio_button = $AudioButton
@onready var graphics_button = $GraphicsButton
@onready var controls_button = $ControlsButton

func _ready():
	# Connect signals using the correct callable syntax
	back_button.pressed.connect(Callable(self, "_on_BackButton_pressed"))
	audio_button.pressed.connect(Callable(self, "_on_AudioButton_pressed"))
	graphics_button.pressed.connect(Callable(self, "_on_GraphicsButton_pressed"))
	controls_button.pressed.connect(Callable(self, "_on_ControlsButton_pressed"))

# Button functions
func _on_BackButton_pressed():
	get_tree().change_scene_to_file("res://assets/scenes/MainMenu.tscn")

func _on_AudioButton_pressed():
	get_tree().change_scene_to_file("res://assets/scenes/AudioMenu.tscn")

func _on_GraphicsButton_pressed():
	get_tree().change_scene_to_file("res://assets/scenes/GraphicsMenu.tscn")

func _on_ControlsButton_pressed():
	get_tree().change_scene_to_file("res://assets/scenes/ControlsMenu.tscn")
