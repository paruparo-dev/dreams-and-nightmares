extends Area2D

class_name HitboxComponent


@onready var collision : CollisionShape2D = $CollisionShape2D


func _ready() -> void:
	disable()


func enable() -> void:
	monitoring = true
	collision.disabled = false
	

func disable() -> void:
	monitoring = false
	collision.disabled = true
	
	
func update(pos: Vector2, dir: int) -> void:
	global_position = pos
	scale.x = signi(dir)
