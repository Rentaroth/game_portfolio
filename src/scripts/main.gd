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
	get_tree().node_added.connect(print_new_node)

	if playerScene:
		protagonist = playerScene.instantiate()
		protagonist.position = Vector2(200, 200)
		add_child(protagonist)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		dialog_area = protagonist.dialog_area
		dialog = protagonist.dialog
		patchment = protagonist.patchment
		if dialog_area:
			patchment.get_child(0).get_child(1).get_child(0).text = JSON.stringify(dialog.get(dialog_area.name))
			patchment.position = protagonist.position
			add_child(patchment)

func print_new_node(node):
	print(node)
	
