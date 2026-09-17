extends Node

class_name SkillsComponent


signal equipped_changed(list: Array[SkillData], index: int)


@export var list : Array[SkillData]


var equipped : SkillData
var index : int


func _ready() -> void:
	equipped = list[0]
	equipped_changed.emit(list, 0)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("SwapSkillLeft"):
		index = (index - 1) % list.size()
		equipped = list[index]
		equipped_changed.emit(list, index)
	elif event.is_action_pressed("SwapSkillRight"):
		index = (index + 1) % list.size()
		equipped = list[index]
		equipped_changed.emit(list, index)