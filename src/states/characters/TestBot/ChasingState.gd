extends State


@export var hitbox : HitboxComponent
@export var speed : float = 100
@export var stop_tolerance: float = 5
@export var lose_tolerance : float = 150
@export var vertical_tolerance : float = 10


var target : Character
var target_x : float


func enter(_data: Variant = null) -> void:
	target = get_tree().get_first_node_in_group("Players")
	
	
func physics_update(_delta: float) -> void:
	if target == null or target.is_queued_for_deletion():
		request.emit("Wandering")
	
	var offset : Vector2 = target.global_position - host.global_position
	var distance : float = offset.length_squared()
	var direction : int = sign(offset.x)

	host.flip_x(direction)
	
	var attack_distance = hitbox.collision.shape.radius * 2
	
	if distance >= lose_tolerance * lose_tolerance:
		request.emit("Wandering")
	elif abs(offset.x) <= attack_distance and abs(offset.y) <= vertical_tolerance:
		request.emit("Attacking")
	elif abs(offset.x) <= stop_tolerance:
		host.velocity.x = 0
	else:
		host.velocity.x = speed * direction
