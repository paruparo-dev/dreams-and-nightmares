extends Node

class_name SkillsComponent


signal equipped_changed(list: Array[Skill], index: int)


var list : Array[Skill]
var equipped : Skill
var index : int


@onready var host : Character = get_parent()


func _ready() -> void:
	for child in get_children():
		if child is Skill:
			list.append(child)
	
	equipped = list[0]
	equipped_changed.emit(list, 0)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("UseSkill"):
		if equipped == null:
			return
		
		equipped.cast(host)
	elif event.is_action_pressed("SwapSkillLeft"):
		index = (index - 1) % list.size()
		equipped = list[index]
		equipped_changed.emit(list, index)
	elif event.is_action_pressed("SwapSkillRight"):
		index = (index + 1) % list.size()
		equipped = list[index]
		equipped_changed.emit(list, index)
		
		
func _exit_tree() -> void:
	for conn in equipped_changed.get_connections():
		equipped_changed.disconnect(conn.callable)
