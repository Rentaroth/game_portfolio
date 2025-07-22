class_name Patchment extends Control

@onready var rich_text_label: RichTextLabel = %RichTextLabel

func _ready() -> void:
	pass

func set_text(text: String):
	rich_text_label.text += text
