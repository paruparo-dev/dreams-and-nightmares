extends Node

class_name Skill


@export var data : SkillData


func cast(source: Character) -> void:
	var scene : PackedScene = load(data.scene_path)
	var instance := scene.instantiate()
	get_tree().current_scene.add_child(instance)
	
	instance.initialize(source)
	
