extends VBoxContainer


@export var host : Character


@onready var label : Label = $Label
	
	
func _physics_process(_delta: float) -> void:
	if host == null:
		_clear()
		return
	
	label.text ="Host: %s\n" % host.name.to_pascal_case() + \
			"State: %s\n" % host.state_machine.current_state.name.to_pascal_case() + \
			"Position: (%.2f, %.2f)\n" % [host.global_position.x, host.global_position.y] + \
			"Direction: %d\n" % host.face_direction + \
			""
	
	
func _clear() -> void:
	label.text = "Host\nState\nPosition\nDirection\n"
