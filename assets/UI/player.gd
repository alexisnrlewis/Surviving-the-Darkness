extends CharacterBody2D

@export var speed := 200
@export var run_speed := 300
@export var jump_force := -400
@export var gravity := 900

var velocity := Vector2.ZERO
var health := 100
var inventory := {}

# === Link to the UI ===
@onready var ui = get_tree().root.get_node("GameScene/TransitionMenu") # adjust if needed

func _physics_process(delta: float) -> void:
    _handle_movement(delta)
    move_and_slide()

func _handle_movement(delta: float) -> void:
    var input_dir = Input.get_axis("move_left", "move_right")
    velocity.x = input_dir * speed
    if Input.is_action_pressed("run"):
        velocity.x = input_dir * run_speed
    if Input.is_action_just_pressed("jump") and is_on_floor():
        velocity.y = jump_force
    if not is_on_floor():
        velocity.y += gravity * delta

func take_damage(amount: int) -> void:
    health = clamp(health - amount, 0, 100)
    if ui: ui.update_health(health)

func heal(amount: int) -> void:
    health = clamp(health + amount, 0, 100)
    if ui: ui.update_health(health)

func collect_item(item_name: String, amount: int = 1) -> void:
    if not inventory.has(item_name):
        inventory[item_name] = 0
    inventory[item_name] += amount
    if ui: ui.add_to_inventory(item_name, amount)
