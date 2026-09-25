extends State


@export var max_speed : float = 100
@export var chase_distance : float = 150


var target : Character
var wander_direction : int
var wander_distance : float
var target_pos : Vector2
var speed : float
var idle_timer : float
var is_wandering : bool


func enter(_data: Variant = null) -> void:
	target = get_tree().get_first_node_in_group("Players")

	_randomize()
	
	host.sprite.play("Wandering")


func physics_update(_delta: float) -> void:
	if target != null:
		var target_distance : float = host.global_position.distance_squared_to(target.global_position)
	
		if target_distance <= chase_distance * chase_distance:
			request.emit("Chasing")
			return
		
	if idle_timer > 0:
		idle_timer -= _delta
		host.velocity.x = 0
			
		return

	if idle_timer <= 0 and not is_wandering:
		_randomize()

	host.flip_x(wander_direction)
	
	var remaining_distance : float = target_pos.x - host.global_position.x
	is_wandering = remaining_distance * wander_direction > 0
	if remaining_distance * wander_direction <= 0:
		host.velocity.x = 0
		idle_timer = randi_range(1, 3)
	else:
		host.velocity.x = speed * wander_direction

	for i in host.get_slide_collision_count():
		var collision := host.get_slide_collision(i)
		var normal := collision.get_normal()

		if host.is_on_wall() and normal.x == -wander_direction:
			wander_direction = sign(normal.x)
			target_pos.x = host.global_position.x + remaining_distance * wander_direction
			target_pos.y = host.global_position.y


func _randomize() -> void:
	wander_direction = [-1, 1].pick_random()
	wander_distance = randf_range(100, 300)
	target_pos.x = host.global_position.x + wander_distance * wander_direction
	target_pos.y = host.global_position.y
	speed = randf_range(0.6, 1) * max_speed
