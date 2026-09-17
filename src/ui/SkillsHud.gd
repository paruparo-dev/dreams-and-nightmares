extends HBoxContainer


class_name SkillsHud


var skill_slots : Array[SkillSlot] = []
			
			
func bind(skills: SkillsComponent) -> void:
	# remove this later and use independent player and UI binding class
	await ready
	
	for child in get_children():
		if child is SkillSlot:
			skill_slots.append(child)
			
	skills.equipped_changed.connect(_update_slots)

	_update_slots(skills.list, 0)
		
		
func _update_slots(skills: Array[SkillData], index: int) -> void:
	for i in range(skill_slots.size()):
		var data := skills[(index + i - 1) % skills.size()]
		skill_slots[i].update_visual(data)
