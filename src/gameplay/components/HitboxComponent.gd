extends Area2D

class_name HitboxComponent


@export var is_disabled_on_ready : bool


var source : Character
var damage : float
var knockback : float


@onready var collision : CollisionShape2D = $CollisionShape2D


func _ready() -> void:
	collision_layer = Game.Layer.HITBOX
	collision_mask = Game.Layer.HURTBOX
	
	if is_disabled_on_ready:
		disable()


func enable() -> void:
	monitoring = true
	collision.set_deferred("disabled", false)
	

func disable() -> void:
	monitoring = false
	collision.set_deferred("disabled", true)
	
	
func update_pos(pos: Vector2, dir: int) -> void:
	global_position = pos
	scale.x = signi(dir)
