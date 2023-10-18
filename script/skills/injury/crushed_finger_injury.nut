this.crushed_finger_injury <- this.inherit("scripts/skills/injury/injury", {
	m = {},
	function create()
	{
		this.injury.create();
		this.m.ID = "injury.crushed_finger";
		this.m.Name = "手指砸伤";
		this.m.Description = "一根手指被不幸击中并砸伤，使得保持紧握非常痛苦。";
		this.m.Type = this.m.Type | this.Const.SkillType.TemporaryInjury;
		this.m.DropIcon = "injury_icon_21";
		this.m.Icon = "ui/injury/injury_icon_21.png";
		this.m.IconMini = "injury_icon_21_mini";
		this.m.HealingTimeMin = 2;
		this.m.HealingTimeMax = 3;
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/melee_skill.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-5%[/color] 近战技能"
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-5%[/color] 远程技能"
			}
		];
		this.addTooltipHint(ret);
		return ret;
	}

	function onUpdate( _properties )
	{
		this.injury.onUpdate(_properties);

		if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
		{
			return;
		}

		_properties.MeleeSkillMult *= 0.95;
		_properties.RangedSkillMult *= 0.95;
	}

});

