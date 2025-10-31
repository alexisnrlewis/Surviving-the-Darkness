extends ProgressBar

func _ready():
	max_value = get_parent().max_health
	value = get_parent().current_health
	
func update_health(current, maximum):
	max_value = maximum
	value = current
	
	# Hide when full health
	visible = current < maximum
