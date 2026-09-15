extends State


@export var speed : float = 200
@export var strength : float = 400


func enter(_data: Variant = null) -> void:
	host.velocity.y = -strength
	
	
func physics_update(_delta: float) -> void:
	host.velocity.y += host.get_gravity().y * _delta
	
	var direction := Input.get_axis("MoveLeft", "MoveRight")
	
	host.velocity.x = direction * speed
	host.flip_x(direction)
	
	if not host.is_on_floor() and host.velocity.y > 0:
		request.emit("Falling")
	elif Input.is_action_just_pressed("Attack"):
		request.emit("Attacking")
