extends TextureProgressBar


class_name HealthBarHUD


func bind(health: HealthComponent) -> void:
	await ready
	
	health.changed.connect(_on_health_changed)
	
	max_value = health.max_value
	value = health.current
	
	_on_health_changed(value)
	
	
func _on_health_changed(new_value: float) -> void:
	value = new_value
