extends VBoxContainer


@export var host : Character


@onready var host_label : Label = $HostLabel
@onready var state_label : Label = $StateLabel
@onready var position_label : Label = $PositionLabel
@onready var direction_label : Label = $DirectionLabel
	
	
func _physics_process(_delta: float) -> void:
	if host == null:
		return
	
	host_label.text = "Host: %s" % host.name.to_pascal_case()
	state_label.text = "State: %s" % host.state_machine.current_state.name.to_pascal_case()
	position_label.text = "Position: (%.2f, %.2f)" % [host.global_position.x, host.global_position.y]
	direction_label.text = "Direction: %d" % host.face_direction
