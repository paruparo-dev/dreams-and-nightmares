extends CharacterBody2D

class_name TestBot


@onready var state_machine : StateMachine = $StateMachine
@onready var health : HealthComponent = $HealthComponent
@onready var hurtbox : HurtboxComponent = $HurtboxComponent


func _ready() -> void:
	health.died.connect(queue_free)
	hurtbox.hurt.connect(health.take_damage)


func _physics_process(delta: float) -> void:
	move_and_slide()
