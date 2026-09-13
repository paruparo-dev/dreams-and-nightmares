extends State


@export var duration : float = 0.1


var timer : float


func enter(data: Variant = null) -> void:
	host.velocity.x = 0
	timer = duration
	
	
func physics_update(delta: float) -> void:
	if timer > 0:
		timer -= delta
		
		if timer <= 0:
			request.emit("Wandering")
		
		return
