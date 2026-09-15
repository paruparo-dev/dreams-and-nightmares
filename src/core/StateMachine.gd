extends Node

class_name StateMachine


signal state_changed(state_name: String)


var states : Dictionary = {}
var current_state : State


@onready var host : Node2D = get_parent()


func _ready() -> void:
	for child in get_children():
		if child is State:
			var state := child as State
			state.request.connect(transition_to)
			state.host = host
			states[state.name.to_pascal_case()] = state
			
	current_state = states.values()[0]
	current_state.enter()

	state_changed.emit(current_state.name.to_pascal_case())


func _physics_process(_delta: float) -> void:
	current_state.physics_update(_delta)


func transition_to(state_name: String, data: Variant = null) -> void:
	state_name = state_name.to_pascal_case()
	
	if not states.has(state_name):
		return
	
	var new_state : State = states[state_name]
	
	if current_state == new_state:
		return
	
	current_state.exit()
	current_state = new_state
	current_state.enter(data)
	
	state_changed.emit(state_name)
