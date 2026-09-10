extends State


@export var speed : float = 200


func physics_update(delta: float) -> void:
	host.velocity.y += host.get_gravity().y * delta

	var direction := Input.get_axis("MoveLeft", "MoveRight")

	host.velocity.x = direction * speed

	if host.is_on_floor():
		request.emit("Idle")
