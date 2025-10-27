# AudioManager.gd
extends Node

var master_volume: float = 1.0
var music_volume: float = 1.0
var sfx_volume: float = 1.0
var muted: bool = false

func set_master_volume(value: float) -> void:
	master_volume = clamp(value, 0.0, 1.0)
	_update_master_bus()

func set_music_volume(value: float) -> void:
	music_volume = clamp(value, 0.0, 1.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear2db(music_volume))

func set_sfx_volume(value: float) -> void:
	sfx_volume = clamp(value, 0.0, 1.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear2db(sfx_volume))

func toggle_mute(is_muted: bool) -> void:
	muted = is_muted
	_update_master_bus()

func _update_master_bus() -> void:
	var volume = 0.0 if muted else master_volume
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear2db(volume))

# Convert linear 0-1 value to decibels
func linear2db(value: float) -> float:
	value = clamp(value, 0.0, 1.0)
	if value <= 0.0:
		return -80.0  # Minimum dB in Godot
	return 20.0 * (log(value) / log(10.0))  # log10(x) using natural log
