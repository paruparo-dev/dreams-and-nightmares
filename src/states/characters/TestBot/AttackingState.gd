extends State


@export var animation : AnimationPlayer

@export var damage : float = 10
@export var knockback : float = 100
@export var attack_cooldown : float = 1


@onready var hitbox : HitboxComponent = $HitboxComponent


func enter(_data: Variant = null) -> void:
	host.sprite.animation_finished.connect(_on_sprite_animation_finished)
	
	host.sprite.play("Attacking")
	animation.play("Attacking")
	
	host.velocity = Vector2.ZERO
	hitbox.source = host
	hitbox.damage = damage
	hitbox.knockback = knockback
	hitbox.update_pos(host.global_position, host.face_direction)
	

func exit() -> void:
	if host.sprite.animation_finished.is_connected(_on_sprite_animation_finished):
		host.sprite.animation_finished.disconnect(_on_sprite_animation_finished)
	host.sprite.stop()
	animation.stop()
	hitbox.disable()
	

func _on_sprite_animation_finished() -> void:
	request.emit("Chasing")
