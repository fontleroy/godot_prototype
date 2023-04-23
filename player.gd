extends CharacterBody2D

@export var speed: int = 35
@onready var animations = $AnimationPlayer

func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection * speed


func updateAnimation():
	if velocity.length() == 0:
		animations.stop()
	else:
		var direction = ""
		if velocity.x < 0: 
			direction = "Left"
			$Sprite2D.flip_h = true #flip animation horizontally
		elif velocity.x > 0: 
			direction = "Right"
			$Sprite2D.flip_h = false #reset flip
		elif velocity.y < 0: 
			direction = "Up"
		elif velocity.y > 0: 
			direction = "Down"
	
		animations.play("Walk" + direction)
	

func _physics_process(_delta):
	handleInput()
	move_and_slide()
	updateAnimation()
