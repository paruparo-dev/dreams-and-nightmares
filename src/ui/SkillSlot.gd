extends PanelContainer

class_name SkillSlot


var data : SkillData


@onready var icon : TextureRect = $Icon


func update_visual(_data: SkillData) -> void:
	if icon == null:
		return
	
	if _data == null:
		return
	
	icon.texture = _data.icon
