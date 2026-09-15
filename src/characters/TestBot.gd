extends CharacterBody2D

class_name TestBot


@onready var state_machine : StateMachine = $StateMachine
@onready var health : HealthComponent = $HealthComponent
@onready var hurtbox : HurtboxComponent = $HurtboxComponent


func _ready() -> void:
	health.died.connect(queue_free)
	hurtbox.hurt.connect(_on_hurt)


func _physics_process(_delta: float) -> void:
	move_and_slide()
	
	
func _on_hurt(hitbox: HitboxComponent) -> void:
	health.take_damage(hitbox.damage)
	state_machine.transition_to("Hit", hitbox)
