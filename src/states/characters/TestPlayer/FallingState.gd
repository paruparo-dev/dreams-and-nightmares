extends State


@export var speed : float = 200


func physics_update(delta: float) -> void:
	host.velocity.y += host.get_gravity().y * delta

	var direction := Input.get_axis("MoveLeft", "MoveRight")

	host.velocity.x = direction * speed
	host.flip_x(direction)

	if host.is_on_floor():
		request.emit("Idle")
	# elif Input.is_action_just_pressed("Attack"):
	# 	request.emit("Attacking")
