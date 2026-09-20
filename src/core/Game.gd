extends Node

class_name Game


enum Layer { PLAYER, BOT, ENVIRONMENT, HITBOX, HURTBOX }


func _ready() -> void:
	get_tree().debug_collisions_hint = true
