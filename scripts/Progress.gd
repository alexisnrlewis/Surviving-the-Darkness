extends TextureProgressBar

@export var max_health: int = 100
var current_health: int = 100

# Optional: for showing a label on top
@onready var health_label = $HealthLabel   # Make sure you have a child Label named "HealthLabel"


func set_health(value: int):
	current_health = clamp(value, 0, max_health)
	update_health_bar()

func update_health_bar():
	value = current_health
	var health_percent = float(current_health) / float(max_health)
	
	# Update the health label text if you have one
	if health_label:
		health_label.text = str(current_health, " / ", max_health)
	
	# Dynamically change bar color: green → yellow → red
	var color: Color
	if health_percent > 0.66:
		color = Color(0, 1, 0)    # green
	elif health_percent > 0.33:
		color = Color(1, 1, 0)    # yellow
	else:
		color = Color(1, 0, 0)    # red
