extends Character

class_name TestBot


@onready var health : HealthComponent = $HealthComponent
@onready var hurtbox : HurtboxComponent = $HurtboxComponent


func _ready() -> void:
	health.died.connect(queue_free)
	hurtbox.hit.connect(_on_hit)
	
	state_machine.transition_to("Wandering")


func _physics_process(_delta: float) -> void:
	move_and_slide()
	
	
func _on_hit(_hitbox: HitboxComponent) -> void:
	health.take_damage(_hitbox.damage)
	state_machine.transition_to("Hit", _hitbox)
