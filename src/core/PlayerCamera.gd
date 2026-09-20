extends Camera2D

class_name PlayerCamera


@export var target : Node2D
@export var speed : float


func _ready() -> void:
	global_position = target.global_position


func _physics_process(_delta: float) -> void:
	var target_pos : Vector2
	if Input.is_action_pressed("LookDown"):
		target_pos = target.global_position
		target_pos.y += abs(offset.y * 2)
	else:
		target_pos = target.global_position
	
	global_position = global_position.slerp(target_pos, 0.1)
