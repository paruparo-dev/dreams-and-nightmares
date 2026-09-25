extends Node

class_name Skill


signal cooldown_changed(remaining: float)


@export var data : SkillData


var cd_timer : float


func _process(_delta: float) -> void:
	if cd_timer > 0:
		cd_timer -= _delta
		cooldown_changed.emit(cd_timer)


func cast(source: Character) -> void:
	if cd_timer > 0:
		return
	
	var scene : PackedScene = load(data.scene_path)
	var instance := scene.instantiate()
	get_tree().current_scene.add_child(instance)
	
	instance.initialize(source)
	
	cd_timer = data.cooldown
	
