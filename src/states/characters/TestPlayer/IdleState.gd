extends State


func physics_update(delta: float) -> void:
	var direction := Input.get_axis("MoveLeft", "MoveRight")
	
	if direction != 0:
		request.emit("Moving")
	elif Input.is_action_just_pressed("Jump"):
		request.emit("Jumping")
