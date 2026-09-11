extends CharacterBody2D

class_name TestPlayer


var sprite_direction : int = 1


@onready var state_machine : StateMachine = $StateMachine
@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	move_and_slide()
	
	
func flip_x(direction: int) -> void:
	if direction == 0:
		return
	
	sprite_direction = signi(direction)
	sprite.flip_h = sprite_direction < 1
