extends State


@export var animation : AnimationPlayer
@export var attack_cooldown : float = 1


@onready var hitbox : HitboxComponent = $HitboxComponent


func enter() -> void:
	if not host.can_attack():
		request.emit("Idle")
		return
	
	# host.attack_cd_timer = attack_cooldown
	
	if not host.is_on_floor():
		host.aerial_attack_count += 1
	
	host.sprite.animation_finished.connect(_on_sprite_animation_finished)
		
	host.sprite.play("Attacking")
	animation.play("Attacking")
	
	host.velocity = Vector2.ZERO
	hitbox.update(host.global_position, host.sprite_direction)
	
	
func exit() -> void:
	if host.sprite.animation_finished.is_connected(_on_sprite_animation_finished):
		host.sprite.animation_finished.disconnect(_on_sprite_animation_finished)
	host.sprite.stop()
	animation.stop()
	
	
func _on_sprite_animation_finished() -> void:
	request.emit("Idle")
