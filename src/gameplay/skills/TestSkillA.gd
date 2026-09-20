extends Area2D


@export var lifetime : float = 1
@export var speed : float = 1000
@export var damage : float = 20
@export var is_destroyed_on_hit : bool = false


var source : Character
var lifetime_timer : float
var direction : Vector2


@onready var hitbox : HitboxComponent = $HitboxComponent


func _physics_process(_delta: float) -> void:
	if lifetime_timer > 0:
		lifetime_timer -= _delta
	
	if lifetime_timer <= 0:
		queue_free()
			
	global_position += direction * speed * _delta
		

func initialize(_source: Character) -> void:
	source = _source
	global_position = source.global_position + Vector2(source.face_direction * 16, -16)
	
	lifetime_timer = lifetime
	direction = Vector2(source.face_direction, 0)
	
	hitbox.damage = damage
	hitbox.area_entered.connect(_on_hitbox_area_entered)
	
	
func _on_hitbox_area_entered(area: Area2D) -> void:
	if area is not HurtboxComponent:
		return
	
	if is_destroyed_on_hit:
		queue_free()
