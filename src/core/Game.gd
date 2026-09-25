extends Node

class_name Game


enum Layer { NONE, PLAYER, BOT, ENVIRONMENT, HITBOX, HURTBOX, COLLECTABLE }


func _ready() -> void:
	get_tree().debug_collisions_hint = true
