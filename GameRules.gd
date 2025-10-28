extends Node

@export var total_nights_to_win: int = 5
var nights_survived: int = 0
var player_lives: int = 3

signal game_won()
signal game_over()
signal life_lost(new_lives)

func _ready():
	print("Game Rules System Ready")
	reset_game()

# === GAME RULES ===
func add_night():
	nights_survived += 1
	print("Night survived:", nights_survived)

	if nights_survived >= total_nights_to_win:
		win_game()

func lose_life():
	player_lives -= 1
	emit_signal("life_lost", player_lives)
	print("Player lost a life. Remaining:", player_lives)

	if player_lives <= 0:
		game_over_event()

func win_game():
	print("🏆 YOU WIN! Survived", nights_survived, "nights!")
	emit_signal("game_won")
	get_tree().change_scene_to_file("res://Scenes/WinScreen.tscn")

func game_over_event():
	print("💀 Game Over! No lives remaining.")
	emit_signal("game_over")
	get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")

func reset_game():
	player_lives = 3
	nights_survived = 0
	print("Game reset. Lives:", player_lives)
