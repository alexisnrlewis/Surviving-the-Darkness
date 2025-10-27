# AudioMenu.gd
extends Control

@onready var master_slider = $VBoxContainer/MasterVolumeSlider
@onready var music_slider = $VBoxContainer/MusicVolumeSlider
@onready var sfx_slider = $VBoxContainer/SFXVolumeSlider
@onready var mute_checkbox = $VBoxContainer/CheckBox

func _ready():
	master_slider.connect("value_changed", Callable(self, "_on_master_slider_changed"))
	music_slider.connect("value_changed", Callable(self, "_on_music_slider_changed"))
	sfx_slider.connect("value_changed", Callable(self, "_on_sfx_slider_changed"))
	mute_checkbox.connect("toggled", Callable(self, "_on_mute_toggled"))

func _on_master_slider_changed(value):
	if AudioManager:
		AudioManager.set_master_volume(value)

func _on_music_slider_changed(value):
	if AudioManager:
		AudioManager.set_music_volume(value)

func _on_sfx_slider_changed(value):
	if AudioManager:
		AudioManager.set_sfx_volume(value)

func _on_mute_toggled(pressed):
	if AudioManager:
		AudioManager.toggle_mute(pressed)
