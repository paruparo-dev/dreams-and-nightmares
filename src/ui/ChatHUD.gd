extends PanelContainer

class_name ChatHUD


@onready var rich_text : RichTextLabel = $RichTextLabel


func _ready() -> void:
	Chat.message_sent.connect(_on_message_sent)
	
	rich_text.clear()
	
	
func _on_message_sent(message: String) -> void:
	if rich_text.text.length() >= 500:
		rich_text.clear()
	
	rich_text.append_text(message)
	rich_text.newline()
