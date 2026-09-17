extends State


func enter(_data: Variant = null) -> void:
	host.sprite.play("Idle")


func physics_update(_delta: float) -> void:
	host.velocity.y += host.get_gravity().y * _delta
	
	var direction := Input.get_axis("MoveLeft", "MoveRight")
	
	host.flip_x(direction)
	
	if direction != 0:
		request.emit("Moving")
	elif not host.is_on_floor() and host.velocity.y >= 0:
		request.emit("Falling")
	elif Input.is_action_pressed("Jump") and host.is_on_floor():
		request.emit("Jumping")
	elif Input.is_action_just_pressed("Attack"):
		request.emit("Attacking")
