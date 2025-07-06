class_name Main extends Node2D

var playerScene = preload("res://src/scenes/player.tscn")

func _ready() -> void:
	get_tree().root.content_scale_mode = Window.CONTENT_SCALE_MODE_VIEWPORT
	get_tree().root.content_scale_aspect = Window.CONTENT_SCALE_ASPECT_KEEP
	get_tree().root.content_scale_factor = 4

	if playerScene:
		var protagonist = playerScene.instantiate()
		protagonist.position = Vector2(80, 80)
		add_child(protagonist)
