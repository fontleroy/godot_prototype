extends Camera2D

export var map_size = Vector2(800, 600)
export var tile_size = 32

var target_pos = Vector2()

func _ready():
	set_process(true)
	target_pos = position

func _process(delta):
	var input_dir = Vector2()

	# Check for player input
	if Input.is_action_pressed("ui_right"):
		input_dir.x += 1
	if Input.is_action_pressed("ui_left"):
		input_dir.x -= 1
	if Input.is_action_pressed("ui_down"):
		input_dir.y += 1
	if Input.is_action_pressed("ui_up"):
		input_dir.y -= 1

	# Move the camera based on input
	var new_pos = target_pos + input_dir * tile_size
	target_pos.x = clamp(new_pos.x, 0, map_size.x - viewport_size.x)
	target_pos.y = clamp(new_pos.y, 0, map_size.y - viewport_size.y)

	position = position.linear_interpolate(target_pos, 0.1)
