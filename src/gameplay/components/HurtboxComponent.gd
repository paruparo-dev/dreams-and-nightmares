extends Area2D

class_name HurtboxComponent


signal hit(hitbox: HitboxComponent)


@onready var host : Character = get_parent()


func _ready() -> void:
	area_entered.connect(_on_area_entered)
	
	
func _on_area_entered(area: Area2D) -> void:
	if area is not HitboxComponent:
		return
	
	if area.source == host:
		return

	hit.emit(area)
