extends State


@export var hitbox : HitboxComponent
@export var speed : float = 100
@export var stop_distance : float = 20
@export var lose_distance : float = 200


var target : Node2D
var target_x : float


func enter(_data: Variant = null) -> void:
	target = get_tree().get_first_node_in_group("Players")
	
	
func physics_update(_delta: float) -> void:
	var target_pos : Vector2 = target.global_position
	var distance : float = (target_pos.x - host.global_position.x)
	var direction : int = sign(distance)

	host.flip_x(direction)
	
	var attack_distance = hitbox.collision.shape.radius * 2
	
	if distance * direction <= stop_distance:
		host.velocity.x = 0
	elif distance * direction >= lose_distance:
		request.emit("Wandering")
	elif distance * direction <= attack_distance:
		request.emit("Attacking")
	else:
		host.velocity.x = speed * direction
