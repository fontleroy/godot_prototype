extends CharacterBody2D

@export var speed: float = 70
@onready var animations = $AnimationPlayer

func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection * speed
	print(velocity.x)


func updateAnimation():
	if Input.is_action_just_pressed("ui_right"):
		var direction = "Right"
		$Sprite2D.flip_h = false #reset flip
		animations.play("Walk" + direction)
		animations.advance(1)
		
	elif Input.is_action_just_released("ui_right"):
		animations.stop()
		
	if Input.is_action_just_pressed("ui_left"):
		var direction = "Left"
		$Sprite2D.flip_h = true #reset flip
		animations.play("Walk" + direction)
		animations.advance(1)
		
	elif Input.is_action_just_released("ui_left"):
		animations.stop()
	
	if Input.is_action_just_pressed("ui_up"):
		var direction = "Up"
		animations.play("Walk" + direction)
		animations.advance(1)
		
	elif Input.is_action_just_released("ui_up"):
		animations.stop()
		
	if Input.is_action_just_pressed("ui_down"):
		var direction = "Down"
		animations.play("Walk" + direction)
		animations.advance(1)
		
	elif Input.is_action_just_released("ui_down"):
		animations.stop()

func _physics_process(_delta):
	handleInput()
	move_and_slide()
	updateAnimation()
