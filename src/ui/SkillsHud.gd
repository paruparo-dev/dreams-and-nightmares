extends HBoxContainer


class_name SkillsHud


var skill_slot_scene : PackedScene = preload("uid://d343aywka0ysw")
var slots : Array[SkillSlot]
			
			
func bind(skills: SkillsComponent) -> void:
	# remove this later and use independent player and UI binding class
	await ready
	
	for i in range(3):
		var instance : SkillSlot = skill_slot_scene.instantiate()
		add_child(instance)
		slots.append(instance)
			
	skills.equipped_changed.connect(_update_slots)

	_update_slots(skills.list, 0)
		
		
func _update_slots(skills: Array[Skill], index: int) -> void:
	if skills.size() <= 1:
		slots[1].update_visual(skills[0].data)
		return
	
	for i in range(slots.size()):
		var skill := skills[(index + i - 1) % skills.size()]
		slots[i].update_visual(skill.data)
