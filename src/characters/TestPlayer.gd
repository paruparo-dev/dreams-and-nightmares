extends CharacterBody2D

class_name TestPlayer


var sprite_direction : int = 1
var attack_cd_timer : float
var aerial_attack_count : int


@onready var state_machine : StateMachine = $StateMachine
@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D


func _process(delta: float) -> void:
	if attack_cd_timer > 0:
		attack_cd_timer -= delta


func _physics_process(delta: float) -> void:
	move_and_slide()
	
	
func can_attack() -> bool:
	if attack_cd_timer > 0:
		return false
	
	if not is_on_floor() and aerial_attack_count >= 1:
		return false
	
	return true
	
	
func flip_x(direction: int) -> void:
	if direction == 0:
		return
	
	sprite_direction = signi(direction)
	sprite.flip_h = sprite_direction < 1
