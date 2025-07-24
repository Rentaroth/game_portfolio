class_name Patchment extends Control

@onready var rich_text_label: RichTextLabel = %RichTextLabel

var scrollSpeed: int = 1
var currentLine: int = 1
var maxLines: int

func _ready() -> void:
	maxLines = rich_text_label.get_line_count()
	rich_text_label.scroll_to_line(currentLine)

func _process(_delta: float) -> void:
	pass

func set_text(text: String):
	rich_text_label.text += text
