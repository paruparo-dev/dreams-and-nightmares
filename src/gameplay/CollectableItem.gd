extends Area2D

class_name CollectableItem


func _ready() -> void:
	body_entered.connect(_on_body_entered)
	
	collision_layer = Game.Layer.COLLECTABLE
	collision_mask = Game.Layer.PLAYER
	
	
func _on_body_entered(body: Node2D) -> void:
	if body is Character:
		if body.has_method("collect_item"):
			body.collect_item(self)
			queue_free()
