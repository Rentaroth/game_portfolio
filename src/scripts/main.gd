class_name Main extends Node2D

var playerScene = preload("res://src/scenes/player.tscn")
var protagonist: Player
var dialog_area
var dialog
var patchment

func _ready() -> void:
	get_tree().root.content_scale_mode = Window.CONTENT_SCALE_MODE_VIEWPORT
	get_tree().root.content_scale_aspect = Window.CONTENT_SCALE_ASPECT_KEEP
	get_tree().root.content_scale_factor = 4

	if playerScene:
		protagonist = playerScene.instantiate()
		protagonist.position = Vector2(200, 200)
		add_child(protagonist)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		dialog_area = protagonist.dialog_area
		dialog = protagonist.dialog
		if dialog_area != null:
			if patchment != protagonist.patchment:
				patchment = protagonist.patchment
				if get_node_or_null("Patchment") == null:
					if dialog_area:
						patchment.get_child(0).get_child(1).get_child(0).text = JSON.stringify(dialog.get(dialog_area.name))
						patchment.position = protagonist.position
						add_child(patchment)
						protagonist.busy = true
			else:
				if get_node_or_null("Patchment") == null:
					add_child(patchment)
					protagonist.busy = true
	
	if Input.is_action_just_pressed("ui_cancel"):
		if get_node_or_null("Patchment") != null:
			protagonist.busy = false
			call_deferred("remove_child", patchment)
