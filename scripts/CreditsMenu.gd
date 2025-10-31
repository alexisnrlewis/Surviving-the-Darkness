extends Control

@onready var back_button = $BackButton

func _ready():
	# Connect the Back button to its function
	back_button.pressed.connect(_on_BackButton_pressed)


func _on_BackButton_pressed():
	# Change back to the Main Menu scene
	get_tree().change_scene_to_file("res://assets/scenes/MainMenu.tscn")
