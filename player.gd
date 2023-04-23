extends CharacterBody2D

const SPEED = 100
const ATTACK_DURATION = 0.5

var input_direction: get = _get_input_direction
var sprite_direction = "Down": get =_get_sprite_direction

@onready var sprite = $AnimatedSprite2D
var attack_timer = 0.5

func _get_input_direction():
	@warning_ignore("shadowed_variable")
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	return input_direction

func _physics_process(delta):
	if attack_timer > 0.0:
		attack_timer -= delta
		if attack_timer <= 0.0:
			set_animation("Walk")
	else:
		velocity = input_direction * SPEED
		move_and_slide()
		set_animation("Walk")
		if velocity == Vector2.ZERO:
			sprite.stop()
		
	set_animation("Walk")
	if velocity == Vector2.ZERO:
		sprite.stop()

func _get_sprite_direction():
	match input_direction:
		Vector2.LEFT:
			sprite_direction = "Left"
		Vector2.RIGHT:
			sprite_direction = "Right"
		Vector2.UP:
			sprite_direction = "Up"
		Vector2.DOWN:
			sprite_direction = "Down"
	return sprite_direction

func set_animation(animation):
	var direction = "Side" if sprite_direction in ["Left", "Right"] else sprite_direction
	sprite.play(animation + direction)
	sprite.flip_h = (sprite_direction == "Left")
