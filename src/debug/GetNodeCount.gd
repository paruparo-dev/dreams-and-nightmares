extends Button


func _ready() -> void:
	pressed.connect(_on_pressed)
	
	
func _on_pressed() -> void:
	var msg : String = "Current nodes in scene: %d" % get_tree().get_node_count()
	print(msg)
	Chat.announce(msg)
