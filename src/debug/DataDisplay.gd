extends VBoxContainer


@export var host : Node2D


@onready var host_label : Label = $HostLabel
@onready var state_label : Label = $StateLabel
@onready var position_label : Label = $PositionLabel
	
	
func _physics_process(delta: float) -> void:
	if host == null:
		return
	
	host_label.text = "Host: %s" % host.name.to_pascal_case()
	state_label.text = "State: %s" % host.state_machine.current_state.name.to_pascal_case()
	position_label.text = "Position: %s" % str(host.global_position)
