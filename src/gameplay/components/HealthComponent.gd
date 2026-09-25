extends Node

class_name HealthComponent


signal changed(new_value: float)
signal died


@export var max_value : float = 100


var current : float = max_value

	
func take_damage(amount: float) -> void:
	current = max(current - amount, 0)
	changed.emit(current)
	
	print("%s Health: %.1f" % [get_parent().name, current])
	
	if current <= 0:
		died.emit()
