extends State


@export var duration : float = 0.1


var timer : float


func enter(_data: Variant = null) -> void:
	host.velocity.x = _data.knockback * signi(host.global_position.x - _data.global_position.x)
	timer = duration
	
	
func physics_update(_delta: float) -> void:
	if timer > 0:
		timer -= _delta
		
		if timer <= 0:
			request.emit("Stunned")
			
		return
