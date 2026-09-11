extends State


@export var animation : AnimationPlayer


@onready var hitbox : HitboxComponent = $HitboxComponent


func enter() -> void:
	host.sprite.animation_finished.connect(_on_sprite_animation_finished)
	host.sprite.play("Attacking")
	animation.play("Attacking")
	
	host.velocity = Vector2.ZERO
	hitbox.update(host.global_position, host.sprite_direction)
	
	
func exit() -> void:
	host.sprite.animation_finished.disconnect(_on_sprite_animation_finished)
	host.sprite.stop()
	animation.stop()
	
	
func _on_sprite_animation_finished() -> void:
	request.emit("Idle")
