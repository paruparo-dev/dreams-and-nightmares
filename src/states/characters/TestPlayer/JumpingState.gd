extends State


@export var speed : float = 200
@export var strength : float = 400


func enter() -> void:
	host.velocity.y = -strength
	
	
func physics_update(delta: float) -> void:
	host.velocity.y += host.get_gravity().y * delta
	
	var direction := Input.get_axis("MoveLeft", "MoveRight")
	
	host.velocity.x = direction * speed
	
	if not host.is_on_floor() and host.velocity.y > 0:
		request.emit("Falling")
