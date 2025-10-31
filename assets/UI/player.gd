extends CharacterBody2D

signal health_changed(new_health)
signal item_collected(item_name, quantity)

@export var player_id := 1
var speed := 150
var run_speed := 250
var jump_force := -400
var gravity := 900
var health := 100

var inventory := {}

func _physics_process(delta: float) -> void:
    var move_left = Input.is_action_pressed("p%d_move_left" % player_id)
    var move_right = Input.is_action_pressed("p%d_move_right" % player_id)
    var is_run = Input.is_action_pressed("p%d_run" % player_id)
    var is_jump = Input.is_action_just_pressed("p%d_jump" % player_id)
    var is_attack = Input.is_action_just_pressed("p%d_attack" % player_id)
    var is_collect = Input.is_action_just_pressed("p%d_collect" % player_id)
    var is_drop = Input.is_action_just_pressed("p%d_drop" % player_id)
    var is_craft = Input.is_action_just_pressed("p%d_craft" % player_id)
    var is_place = Input.is_action_just_pressed("p%d_place" % player_id)

    # Movement
    var velocity_x = 0.0
    if move_left:
        velocity_x -= 1
    if move_right:
        velocity_x += 1

    velocity_x *= is_run ? run_speed : speed
    velocity.x = velocity_x
    velocity.y += gravity * delta

    if is_jump and is_on_floor():
        velocity.y = jump_force

    move_and_slide()

    # Actions
    if is_attack:
        perform_attack()
    if is_collect:
        collect_item("resource")
    if is_drop:
        drop_item("resource")
    if is_craft:
        craft_item()
    if is_place:
        place_structure()

func perform_attack():
    print("Player %d attacks!" % player_id)

func collect_item(item_name: String, quantity: int = 1) -> void:
    if item_name in inventory:
        inventory[item_name] += quantity
    else:
        inventory[item_name] = quantity
    emit_signal("item_collected", item_name, quantity)
    print("Player %d collected %s" % [player_id, item_name])

func drop_item(item_name: String) -> void:
    if item_name in inventory:
        inventory[item_name] -= 1
        if inventory[item_name] <= 0:
            inventory.erase(item_name)
        print("Player %d dropped %s" % [player_id, item_name])
        emit_signal("item_collected", item_name, -1)

func craft_item():
    print("Player %d crafts an item." % player_id)

func place_structure():
    print("Player %d places a structure." % player_id)
