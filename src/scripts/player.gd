class_name Player extends CharacterBody2D

@onready var player_animation: AnimatedSprite2D = %PlayerAnimation
const Patchment_scene: PackedScene = preload("res://src/scenes/Patchment.tscn")

var speed: float = 100
var last_direction: Vector2
var dialog_area: DialogArea
var dialog: Dictionary
var patchment: Patchment
var busy: bool = false

func _ready() -> void:
	player_animation.play("idle_down")

func _process(_delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	if !busy:
		move_and_slide()
		move_direction(direction)

func _on_player_dialogue_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("DialogueArea"):
		dialog_area = area
		if not dialog.get(area.name):
			print("Assigned dialogue to the area, waiting for dialogue action!")
			#dialog = {
				#area.name: await area.get_dialogue_as_json("res://src/dialogues/" + area.name + ".json")
			#}
			dialog = {
				area.name: await area.get_dialogue("res://src/dialogues/" + area.name + ".diag")
			}
			if Patchment_scene:
				if !patchment:
					patchment = Patchment_scene.instantiate()

func _on_player_dialogue_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("DialogueArea"):
		dialog_area = null

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
