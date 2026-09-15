extends Node

class_name State


@warning_ignore("unused_signal")
signal request(state_name: String)


var host : CharacterBody2D


func enter(_data: Variant = null) -> void:
	pass


func exit() -> void:
	pass


func physics_update(_delta: float) -> void:
	pass
