extends CharacterBody2D

@export var speed := 200
@export var max_health := 100
@export var melee_damage := 25
@export var attack_cooldown := 0.6

var health := max_health
var score := 0
var can_attack := true
var attack_timer := 0.0
var is_downed := false

signal player_downed
signal score_changed(new_score)

func _ready():
    print("Player ready")

func _physics_process(delta):
    if is_downed:
        return

    handle_movement(delta)
    handle_attack(delta)

func handle_movement(delta):
    var input_vector = Vector2.ZERO
    input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
    input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

    if input_vector.length() > 0:
        velocity = input_vector.normalized() * speed
    else:
        velocity = Vector2.ZERO

    move_and_slide()

func handle_attack(delta):
    if Input.is_action_just_pressed("attack") and can_attack:
        perform_melee_attack()

    if not can_attack:
        attack_timer += delta
        if attack_timer >= attack_cooldown:
            can_attack = true
            attack_timer = 0

func perform_melee_attack():
    can_attack = false
    var enemies = get_tree().get_nodes_in_group("enemies")
    for e in enemies:
        if position.distance_to(e.position) < 50:
            e.take_damage(melee_damage)
            add_score(20)  # Reward for hitting an enemy

func take_damage(amount):
    health -= amount
    if health <= 0:
        is_downed = true
        emit_signal("player_downed")

func revive():
    is_downed = false
    health = max_health / 2
    print("Player revived!")

func add_score(points):
    score += points
    emit_signal("score_changed", score)
