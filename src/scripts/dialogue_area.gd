class_name DialogArea extends Area2D

func _ready() -> void:
	pass

func get_dialogue_as_json(path: String) -> Dictionary:
	var dialogue = get_dialogue(path)
	var json_dialogue = JSON.parse_string(dialogue)
	return json_dialogue

func get_dialogue(path: String) -> String:
	var file = FileAccess.open(path, FileAccess.READ)
	var content = file.get_as_text()
	return content
