extends Area2D

class_name HurtboxComponent


signal hit(hitbox: HitboxComponent)


@onready var host : Character = get_parent()


func _ready() -> void:
	collision_layer = Game.Layer.HURTBOX
	collision_mask = Game.Layer.HITBOX
	
	area_entered.connect(_on_area_entered)
	
	
func _on_area_entered(area: Area2D) -> void:
	if area is not HitboxComponent:
		return
	
	var hitbox := area as HitboxComponent
	
	if hitbox.source == host:
		return
	
	hit.emit(hitbox)
