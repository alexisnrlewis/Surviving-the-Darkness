extends Node

var score: int = 0

signal score_changed(new_score)

func _ready():
	score = 0
	print("Score system ready")

func add_points(points: int):
	score += points
	print("Player earned", points, "points. Total:", score)
	emit_signal("score_changed", score)

func reset_score():
	score = 0
	emit_signal("score_changed", score)
