extends State


@export var max_speed : float = 100


var target : Node2D
var direction : int
var distance : float
var speed : float
var target_x : float
var idle_timer : float


func enter() -> void:
	target = get_tree().get_first_node_in_group("Players")

	_randomize()


func physics_update(delta: float) -> void:
	if idle_timer > 0:
		idle_timer -= delta
		
		if idle_timer <= 0:
			_randomize()
			
		return
	
	var remaining_distance : float = (target_x - host.global_position.x) * direction
	if remaining_distance <= 0:
		host.velocity.x = 0
		idle_timer = randf_range(1, 3)
	else:
		host.velocity.x = speed * direction

	for i in host.get_slide_collision_count():
		var collision := host.get_slide_collision(i)
		var normal := collision.get_normal()

		if host.is_on_wall() and normal.x == -direction:
			direction = sign(normal.x)
			target_x = host.global_position.x + abs(target_x - host.global_position.x) * direction


func _randomize() -> void:
	direction = [-1, 1].pick_random()
	
	distance = randf_range(100, 300)

	target_x = host.global_position.x + distance * direction
	
	speed = randf_range(0.6, 1) * max_speed

	Debug.begin().dict(name, {
		"direction": direction,
		"distance": distance,
		"host.global_position.x": host.global_position.x,
		"target_x": target_x,
		"speed": speed
	}).end()
