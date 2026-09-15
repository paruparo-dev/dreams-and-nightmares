extends CharacterBody2D

class_name TestPlayer


var face_direction : int = 1
var attack_cd_timer : float
var aerial_attack_count : int


@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine : StateMachine = $StateMachine
@onready var health : HealthComponent = $HealthComponent
@onready var hurtbox : HurtboxComponent = $HurtboxComponent


func _ready() -> void:
	health.died.connect(queue_free)
	hurtbox.hurt.connect(_on_hurt)
	
	state_machine.transition_to("Idle")


func _process(_delta: float) -> void:
	if attack_cd_timer > 0:
		attack_cd_timer -= _delta


func _physics_process(_delta: float) -> void:
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

	face_direction = signi(direction)
	sprite.flip_h = face_direction < 1


func _on_hurt(hitbox: HitboxComponent) -> void:
	health.take_damage(hitbox.damage)
	state_machine.transition_to("Hit", hitbox)
