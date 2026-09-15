extends Node

class_name HealthComponent


signal changed(new_value: float)
signal died


@export var maximum : float = 100


var current : float = maximum

	
func take_damage(amount: float) -> void:
	current = max(current - amount, 0)
	changed.emit(current)
	
	print("%s Health: %.2f" % [get_parent().name, current])
	
	if current <= 0:
		died.emit()
