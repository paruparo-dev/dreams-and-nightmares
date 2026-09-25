extends Button


@export var target : Character


func _ready() -> void:
	pressed.connect(_on_pressed)


func _on_pressed() -> void:
	if target == null or target.is_queued_for_deletion():
		return
	
	var health : HealthComponent = target.get_component(HealthComponent)
	if health != null:
		health.take_damage(health.current)
	
	var msg : String = "%s has been destroyed" % target.name
	print(msg)
	Chat.announce(msg)
