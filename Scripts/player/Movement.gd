extends CharacterBody2D

var grid_size = 128
var position_x = 2
var position_y = 2
var can_move = true

func _ready():
	position = Vector2(position_x * grid_size, position_y * grid_size)

func _process(_delta):
	if can_move:
		var direction = Vector2.ZERO
		if Input.is_action_pressed ("move_right"):
			position_x += 1
			can_move = false
		if Input.is_action_pressed ("move_left"):
			position_x -= 1
			can_move = false
		if Input.is_action_pressed ("move_down"):
			position_y += 1
			can_move = false
		if Input.is_action_pressed ("move_up"):
			position_y -= 1
			can_move = false
		
		if direction != Vector2.ZERO:
			direction = direction.normalized()
			var collision = move_and_collide(direction * grid_size)
			
			if collision == null:
				position += direction * grid_size
				position_x = int(position_x / grid_size)
				position_y = int(position_y / grid_size)

	if not Input.is_action_pressed("move_right") and \
		not Input.is_action_pressed("move_left") and \
		not Input.is_action_pressed("move_down") and \
		not Input.is_action_pressed("move_up"):
			can_move = true
