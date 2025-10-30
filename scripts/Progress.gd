extends TextureProgressBar

@export var max_health: int = 100
var current_health: int = 100

func _ready():
	update_health_bar()

func set_health(value: int):
	current_health = clamp(value, 0, max_health)
	update_health_bar()

func update_health_bar():
	value = current_health
	
	var health_percent = float(current_health) / float(max_health)
	
	# Dynamically change color: green → yellow → red
	if health_percent > 0.66:
		modulate = Color(0, 1, 0)    # green
	elif health_percent > 0.33:
		modulate = Color(1, 1, 0)    # yellow
	else:
		modulate = Color(1, 0, 0)    # red
