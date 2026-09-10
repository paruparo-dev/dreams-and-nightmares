extends CharacterBody2D

class_name TestBot


@onready var state_machine : StateMachine = $StateMachine


func _physics_process(delta: float) -> void:
	move_and_slide()
