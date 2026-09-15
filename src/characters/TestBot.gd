extends CharacterBody2D

class_name TestBot


var face_direction : int = 1


@onready var state_machine : StateMachine = $StateMachine
@onready var health : HealthComponent = $HealthComponent
@onready var hurtbox : HurtboxComponent = $HurtboxComponent


func _ready() -> void:
	health.died.connect(queue_free)
	hurtbox.hurt.connect(_on_hurt)


func _physics_process(_delta: float) -> void:
	move_and_slide()


func flip_x(direction: int) -> void:
	if direction == 0:
		return

	face_direction = signi(direction)
	# sprite.flip_h = face_direction < 1
	
	
func _on_hurt(hitbox: HitboxComponent) -> void:
	health.take_damage(hitbox.damage)
	state_machine.transition_to("Hit", hitbox)
