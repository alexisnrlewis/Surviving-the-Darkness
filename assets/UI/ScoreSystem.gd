extends Node

@onready var ui = get_tree().root.get_node("GameScene/TransitionMenu")

var current_night := 1
var night_duration := 120.0 # seconds per night
var night_timer := 0.0

func _process(delta: float) -> void:
    night_timer += delta
    if night_timer >= night_duration:
        night_timer = 0.0
        _advance_night()

func _advance_night() -> void:
    current_night += 1
    if ui:
        ui.set_night(current_night)
