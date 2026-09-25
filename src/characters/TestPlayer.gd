extends Character

class_name TestPlayer


@export var skills_hud : SkillsHUD


var attack_cd_timer : float
var aerial_attack_count : int
var can_attack : bool:
	get:
		if attack_cd_timer > 0:
				return false
		
		if not is_on_floor() and aerial_attack_count >= 1:
				return false
		
		return true


@onready var health : HealthComponent = $HealthComponent
@onready var hurtbox : HurtboxComponent = $HurtboxComponent
@onready var skills : SkillsComponent = $SkillsComponent


func _ready() -> void:
	health.died.connect(queue_free)
	hurtbox.hit.connect(_on_hit)
	
	state_machine.transition_to("Idle")

	# remove this later and use independent player and UI binding class
	skills_hud.bind(skills)


func _process(_delta: float) -> void:
	if attack_cd_timer > 0:
		attack_cd_timer -= _delta


func _physics_process(_delta: float) -> void:
	move_and_slide()
	
	
func collect_item(item: CollectableItem) -> void:
	Chat.send("collected %s" % item.name, name)


func _on_hit(_hitbox: HitboxComponent) -> void:
	health.take_damage(_hitbox.damage)
	state_machine.transition_to("Hit", _hitbox)
