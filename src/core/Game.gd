extends Node

class_name Game


enum Layer { NONE, PLAYER, BOT, ENVIRONMENT, HITBOX, HURTBOX, COLLECTABLE }
	
	
@export var debug_collisions_enabled : bool


func _ready() -> void:
	get_tree().debug_collisions_hint = debug_collisions_enabled
