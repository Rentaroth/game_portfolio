class_name Arrows extends Node2D

func _ready() -> void:
	get_child(0).play("rotateDown")
