extends CharacterBody2D

var grid_size = 128
var can_move = true
var movement = Vector2.ZERO

func _ready():
	position = position.snapped(Vector2(grid_size, grid_size)) # Alinha o personagem ao grid ao iniciar

func _process(_delta):
	if can_move:
		if Input.is_action_just_pressed("move_right"):
			movement = Vector2(1, 0)
			can_move = false
		elif Input.is_action_just_pressed("move_left"):
			movement = Vector2(-1, 0)
			can_move = false
		elif Input.is_action_just_pressed("move_down"):
			movement = Vector2(0, 1)
			can_move = false
		elif Input.is_action_just_pressed("move_up"):
			movement = Vector2(0, -1)
			can_move = false
			
		if not can_move:
			move_one_tile()

func move_one_tile():
	var target_position = position + (movement * grid_size)
	
	# Verifica colisão antes de mover
	if not is_colliding(target_position):
		position = target_position.snapped(Vector2(grid_size, grid_size)) # Move e alinha ao grid
	else:
		print("Movimento bloqueado!")
		
	movement = Vector2.ZERO
	can_move = true

func is_colliding(target_position):
	# Usamos move_and_collide para prever colisões sem alterar a posição real
	var collision = move_and_collide(target_position - position)
	return collision != null

#Anotação: Para evitar que o personagem ficasse travando nas colisões do cenario, a sua colisão do
#nodulo CollisionShape2D foi reduzida de 128x128 para 127,5x127,5
#Me sinto orgulhoso por ter pensado nisso sozinho
