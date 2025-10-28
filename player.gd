extends CharacterBody2D

@export var speed: float = 200.0
@export var run_speed: float = 300.0
@export var jump_force: float = 400.0
@export var gravity: float = 900.0

var is_alive: bool = true

signal player_jumped()
signal player_landed()

func _physics_process(delta):
	if not is_alive:
		return
		
	handle_movement(delta)
	apply_gravity(delta)

# === MOVEMENT SYSTEM ===
func handle_movement(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1

	# Running (hold Shift)
	var current_speed = Input.is_action_pressed("run") ? run_speed : speed
	velocity.x = direction.x * current_speed

	# Jumping
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = -jump_force
		emit_signal("player_jumped")

	move_and_slide()

# === GRAVITY ===
func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		emit_signal("player_landed")
	move_and_slide()
