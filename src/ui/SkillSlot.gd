extends PanelContainer

class_name SkillSlot


var skill : Skill


@onready var icon : TextureRect = $Icon
@onready var cooldown_panel : PanelContainer = $CooldownPanel
@onready var cd_timer : Label = $CooldownPanel/CDTimerLabel


func bind(_skill: Skill) -> void:
	skill = _skill
	
	cooldown_panel.visible = false
	
	if not skill.cooldown_changed.is_connected(_on_skill_cooldown_changed):
		skill.cooldown_changed.connect(_on_skill_cooldown_changed)
		
		
func unbind() -> void:
	if skill == null:
		return

	cooldown_panel.visible = false
	
	if skill.cooldown_changed.is_connected(_on_skill_cooldown_changed):
		skill.cooldown_changed.disconnect(_on_skill_cooldown_changed)


func update_visual(_data: SkillData) -> void:
	if icon == null:
		return
	
	if _data == null:
		return
	
	icon.texture = _data.icon
	
	
func _on_skill_cooldown_changed(remaining: float) -> void:
	if remaining <= 0:
		cd_timer.text = ""
		cooldown_panel.visible = false
		return

	if not cooldown_panel.visible:
		cooldown_panel.visible = true
	
	cd_timer.text = "%.1f" % remaining
