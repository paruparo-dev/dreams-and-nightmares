extends CharacterBody2D

class_name Character


var face_direction : int = 1


@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine : StateMachine = $StateMachine


func flip_x(direction: float) -> void:
	if direction == 0:
		return

	face_direction = sign(direction)
	sprite.flip_h = face_direction < 1
	
	
func _on_hit(_hitbox: HitboxComponent) -> void:
	pass
