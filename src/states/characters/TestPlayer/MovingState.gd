extends State


@export var speed : float = 200


func physics_update(delta: float) -> void:
	var direction := Input.get_axis("MoveLeft", "MoveRight")

	host.velocity.x = direction * speed
	
	if host.velocity.x == 0:
		request.emit("Idle")
	elif Input.is_action_just_pressed("Jump"):
		request.emit("Jumping")
