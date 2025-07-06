class_name Player extends CharacterBody2D

@onready var player_animation: AnimatedSprite2D = %PlayerAnimation

var speed: float = 100
var last_direction: Vector2

func _ready() -> void:
	player_animation.play("idle_down")

func _process(_delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	move_and_slide()
	move_direction(direction)

func move_direction(direct: Vector2) -> void:
	if Input.is_action_pressed("ui_left"):
		if direct == Vector2.ZERO:
			player_animation.play("idle_down")
		elif !Input.is_action_pressed("ui_down")\
		or !Input.is_action_pressed("ui_up"):
			player_animation.play("run_left")
		elif Input.is_action_pressed("ui_down")\
		or Input.is_action_pressed("ui_up"):
			if direct == Vector2.ZERO:
				player_animation.play("idle_down")
			else:
				player_animation.play("run_left")
		last_direction = direct
	elif Input.is_action_pressed("ui_right"):
		if direct == Vector2.ZERO:
			player_animation.play("idle_down")
		elif !Input.is_action_pressed("ui_down")\
		or !Input.is_action_pressed("ui_up"):
			player_animation.play("run_right")
		elif Input.is_action_pressed("ui_down")\
		or Input.is_action_pressed("ui_up"):
			if direct == Vector2.ZERO:
				player_animation.play("idle_down")
			else:
				player_animation.play("run_right")
		last_direction = direct
	elif Input.is_action_pressed("ui_up"):
		if direct == Vector2.ZERO:
			player_animation.play("idle_down")
		elif !Input.is_action_pressed("ui_left")\
		or !Input.is_action_pressed("ui_right"):
			player_animation.play("run_up")
		elif Input.is_action_pressed("ui_left")\
		or Input.is_action_pressed("ui_right"):
			if direct == Vector2.ZERO:
				player_animation.play("idle_down")
			else:
				player_animation.play("run_up")
		last_direction = direct
	elif Input.is_action_pressed("ui_down"):
		if direct == Vector2.ZERO:
			player_animation.play("idle_down")
		elif !Input.is_action_pressed("ui_left")\
		or !Input.is_action_pressed("ui_right"):
			player_animation.play("run_down")
		elif Input.is_action_pressed("ui_left")\
		or Input.is_action_pressed("ui_right"):
			if direct == Vector2.ZERO:
				player_animation.play("idle_down")
			else:
				player_animation.play("run_down")
		last_direction = direct
	
	if Input.is_action_just_released("ui_left"):
		if !Input.is_anything_pressed():
			if last_direction.x == Vector2.LEFT.x\
			and last_direction.y == 0:
				player_animation.play("idle_left")
			elif last_direction.y != 0:
				player_animation.play("idle_left")
	elif Input.is_action_just_released("ui_right"):
		if !Input.is_anything_pressed():
			if last_direction.x == Vector2.RIGHT.x\
			and last_direction.y == 0:
				player_animation.play("idle_right")
			elif last_direction.y != 0:
				player_animation.play("idle_right")
	elif Input.is_action_just_released("ui_down"):
		if !Input.is_anything_pressed():
			if last_direction.y == Vector2.DOWN.y\
			and last_direction.x == 0:
				player_animation.play("idle_down")
			elif last_direction.x != 0:
				player_animation.play("idle_down")
	elif Input.is_action_just_released("ui_up"):
		if !Input.is_anything_pressed():
			if last_direction.y == Vector2.UP.y\
			and last_direction.x == 0:
				player_animation.play("idle_up")
			elif last_direction.x != 0:
				player_animation.play("idle_up")
